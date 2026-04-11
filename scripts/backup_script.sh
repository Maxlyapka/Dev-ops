#!/bin/bash

# ==============================================================================
# Script Name: backup_script.sh
# Description: Automated backup of web content and database with SCP transfer
# Author: Maksym Romanov
# ==============================================================================

# Environment Variables
BACKUP_DIR="/archive"
DATE=$(date +%F)
WEB_DIR="/var/www/html"
DB_USER="root"
DB_PASS="dummy_pass_123" # In a real environment, use .my.cnf
DB_NAME="Jimmy"
REMOTE_USER="root"
REMOTE_HOST="172.27.27.121" # Backup Server IP
REMOTE_DIR="/remote_backups"

echo "[$(date +'%Y-%m-%d %H:%M:%S')] Starting backup process..."

# 1. Create local backup directory (if it doesn't exist)
mkdir -p $BACKUP_DIR

# 2. Backup web directory
tar -czf $BACKUP_DIR/web_backup_$DATE.tar.gz $WEB_DIR
echo "[+] Web directory successfully archived."

# 3. Backup database (MariaDB/MySQL)
mysqldump -u $DB_USER -p"$DB_PASS" $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql
tar -czf $BACKUP_DIR/db_backup_$DATE.tar.gz -C $BACKUP_DIR db_backup_$DATE.sql
rm $BACKUP_DIR/db_backup_$DATE.sql
echo "[+] Database successfully archived."

# 4. Send to remote server via SCP
# Note: Passwordless SSH keys must be configured for cron execution
scp $BACKUP_DIR/*_$DATE.tar.gz $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR
if [ $? -eq 0 ]; then
    echo "[+] Backups successfully transferred to remote server $REMOTE_HOST."
else
    echo "[-] Error: Failed to transfer files via SCP!"
fi

# 5. Backup rotation (delete files older than 7 days)
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -delete
echo "[+] Cleanup of old backups completed."

echo "[$(date +'%Y-%m-%d %H:%M:%S')] Backup process finished successfully!"
