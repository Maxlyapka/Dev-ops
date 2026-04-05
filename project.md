# Comprehensive DevOps Project Report

## OS Installation and Storage Setup
I started the project by installing three different Linux distributions: Ubuntu, Rocky Linux, and Debian. I wanted to see how they handle different storage setups. On Rocky Linux, I configured LVM by creating a volume group and a logical volume specifically for the database. On Debian, I set up Software RAID1 for the root system to make sure the data stays safe if one disk fails.

## Networking and Security
I changed the default SSH port to 2222 and turned off password login. Now I only use ed25519 keys for access. I had a small issue with the new Ubuntu version because it uses socket activation for SSH, so I had to stop the socket and start the classic service instead. I also set up a devops group and configured sudoers so I don't have to work as root all the time. For the internal nodes, I configured NAT with iptables so they can access the internet through the main server.

## System Recovery and Troubleshooting
I practiced how to recover systems when they don't boot. On Debian and Rocky Linux, I learned how to reset the admin password by changing kernel parameters. I also successfully recovered a system that was stuck in the EFI Shell. I used a Live CD and chroot to reinstall the kernel and fix the bootloader.

## Backup Automation
I wrote a Bash script that automatically archives important folders like /etc and /home. The script adds the current date and time to the filename so I can keep track of different versions. It automatically sends these backups to another server using SCP. I set up a cron job to run this script every night at 3:00 AM.

## Web Infrastructure and Load Balancing
I built a web cluster where Nginx acts as a load balancer for two Apache servers. To keep the website files synchronized, I set up an NFS server so all nodes can share the same folder. I also added SSL certificates from Let's Encrypt and configured PHP to work with both Apache and PHP-FPM.

## Database Management
I installed MariaDB and made sure it is secure. It only accepts connections from localhost, so it's not visible to the outside world. I created a config file with 600 permissions to log in as root without typing the password in the terminal, which is much safer.

## Monitoring and Logging
For monitoring, I used Zabbix 7.0 LTS. I had to troubleshoot some issues with the agents to make sure they collect data from Nginx and Apache correctly. For logs, I deployed Graylog with OpenSearch and MongoDB. A big lesson I learned here was about server resources. My server crashed with an Out-of-Memory (OOM) error because Graylog needs a lot of RAM for Java. It was a good experience in analyzing resource limits.

* ## Key Challenges & Lessons Learned

**Issue:** Out-of-Memory (OOM) errors during Graylog deployment.
**Lesson:** Gained experience in analyzing JVM heap usage and configuring resource limits.
**Issue:** SSH port conflict on Ubuntu 24.04.
**Lesson:** Researched systemd socket activation and resolved service conflicts.

[Full Project Report (UA)](project_report.md)
