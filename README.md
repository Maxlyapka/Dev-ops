# Comprehensive DevOps Project

## OS Installation and Storage Setup
Installed and configured three Linux distributions: **Ubuntu**, **Rocky Linux**, and **Debian**. 
- Implemented **LVM** on Rocky Linux with a dedicated volume group for database storage.
- Configured **Software RAID1** on Debian to ensure system redundancy and data integrity.

## Networking and Security
- **SSH Hardening:** Changed default port to `2222`, disabled password authentication, and enforced **ed25519** public key access.
- **Service Management:** Resolved Ubuntu 24.04 SSH socket activation conflicts by migrating to the classic systemd service.
- **Access Control:** Configured `sudoers` and specialized user groups to follow the principle of least privilege.
- **Connectivity:** Implemented **NAT** using `iptables` to provide internet access for internal cluster nodes.

## System Recovery and Troubleshooting
- Successfully practiced administrative password resets on Debian and Rocky Linux by modifying kernel parameters.
- Recovered a non-booting system from **EFI Shell** using Live CD environments and `chroot` for bootloader repair.

## Backup Automation
- Developed a **Bash script** for automated backups of `/etc` and `/home` directories.
- The script includes timestamped versioning and secure transfer via **SCP**.
- Scheduled tasks via **Cron** to run nightly at 3:00 AM.

## Web Infrastructure and Load Balancing
- Deployed a highly available web cluster: **Nginx** acting as a Layer 7 Load Balancer for multiple **Apache** backend nodes.
- Implemented **NFS** (Network File System) to ensure real-time content synchronization across all web nodes.
- Secured traffic with **SSL/TLS** (Let's Encrypt) and optimized PHP performance using **PHP-FPM**.

## Database Management
- Deployed **MariaDB** with security hardening (`mysql_secure_installation`).
- Configured secure internal networking by binding the service to the cluster's private interface.
- Automated database management by configuring `.my.cnf` with restricted permissions (`600`) for passwordless administrative access.

## Monitoring and Logging
- **Monitoring:** Deployed **Zabbix 7.0 LTS** with custom agents to monitor Nginx and Apache health.
- **Logging:** Implemented a centralized logging stack using **Graylog**, **OpenSearch**, and **MongoDB**.
- **Resource Management:** Analyzed and resolved **Out-of-Memory (OOM)** errors by fine-tuning JVM heap settings for Java-based services.

## Key Challenges & Lessons Learned

| Issue | Solution |
| :--- | :--- |
| **Graylog OOM Crash** | Analyzed JVM heap usage and optimized RAM allocation limits. |
| **SSH Port Conflict** | Researched systemd socket activation and reconfigured service listeners. |
| **Web Syncing** | Implemented NFS to maintain a single source of truth for web content. |

---
*Note: This repository contains the configuration files and automation scripts from the full project.*

[View Full Project Report with Screenshots (PDF)]()
