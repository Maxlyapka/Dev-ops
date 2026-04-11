### MariaDB Security & Configuration

The following database tasks were successfully implemented:
- **Service Hardening:** Performed initial security configuration (securing root access and removing default test environments).
- **Remote Access:** Configured MariaDB to allow secure connections from internal cluster nodes.
- **Automation:** Set up `.my.cnf` with strict permissions (`chmod 600`) to enable secure, automated backups and monitoring without exposing passwords in the command line.
