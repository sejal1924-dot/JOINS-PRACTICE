BACKUP & RECOVERY TASK PACKAGE
  PART 1: MySQL Backup & Restore
📁 mysql_backup.sh

#!/bin/bash
# Backup MySQL database

DB_NAME="mydb"
USER="root"
PASSWORD="your_mysql_password"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="backup_${DB_NAME}_${DATE}.sql"

mysqldump -u $USER -p$PASSWORD $DB_NAME > $BACKUP_FILE

echo "✅ MySQL backup saved to $BACKUP_FILE"
📁 mysql_restore.sh

#!/bin/bash
# Restore MySQL database

DB_NAME="mydb_restored"
USER="root"
PASSWORD="your_mysql_password"
BACKUP_FILE="backup_mydb_2024-01-01.sql"  # Change as needed

mysql -u $USER -p$PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u $USER -p$PASSWORD $DB_NAME < $BACKUP_FILE

echo "✅ MySQL database restored from $BACKUP_FILE"
🔹 PART 2: PostgreSQL Backup & Restore
📁 pg_backup.sh
bash
Copy
Edit
#!/bin/bash
# Backup PostgreSQL database

DB_NAME="mydb_pg"
USER="postgres"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="backup_${DB_NAME}_${DATE}.sql"

pg_dump -U $USER -F p $DB_NAME > $BACKUP_FILE

echo "✅ PostgreSQL backup saved to $BACKUP_FILE"
 pg_restore.sh

#!/bin/bash
# Restore PostgreSQL database

DB_NAME="mydb_pg_restored"
USER="postgres"
BACKUP_FILE="backup_mydb_pg_2024-01-01.sql"  # Change as needed

createdb -U $USER $DB_NAME
psql -U $USER -d $DB_NAME -f $BACKUP_FILE

echo "✅ PostgreSQL database restored from $BACKUP_FILE"
  backup_recovery_report.txt

DATABASE BACKUP & RECOVERY REPORT

Databases: MySQL (mydb), PostgreSQL (mydb_pg)
Date: [Auto-generated]
Tool: mysqldump / mysql, pg_dump / psql

====================
✅ Backup Summary:
- MySQL: mysqldump creates SQL file
- PostgreSQL: pg_dump creates SQL file

====================
✅ Restore Summary:
- MySQL: mysql CLI used to import .sql file
- PostgreSQL: createdb + psql used for restore

====================
STATUS: FULL BACKUP & RECOVERY SUCCESSFUL