#!/bin/bash
# Description: Automated backup of critical system directories.
# Trigger: Configured to run daily at 03:00 AM via crontab.

DATE_DIR=$(date +"%Y-%m-%d")
TIME_FILE=$(date +"%H%M")
REMOTE_USER="root"
REMOTE_HOST="<NODE2_IP_ADDRESS>"
REMOTE_DEST="/backup/$DATE_DIR"
TEMP_DIR="/tmp/backup_temp"

mkdir -p $TEMP_DIR
tar -czf $TEMP_DIR/etc_backup_${DATE_DIR}_${TIME_FILE}.tar.gz /etc 2>/dev/null
tar -czf $TEMP_DIR/home_backup_${DATE_DIR}_${TIME_FILE}.tar.gz /home 2>/dev/null

ssh -p 2222 $REMOTE_USER@$REMOTE_HOST "mkdir -p $REMOTE_DEST"
scp -P 2222 $TEMP_DIR/*.tar.gz $REMOTE_USER@$REMOTE_HOST:$REMOTE_DEST/

rm -rf $TEMP_DIR
echo "Backup and transfer completed successfully at $(date)"
