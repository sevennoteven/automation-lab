#!/bin/bash
# ----------------------------------------------------------
# Script Name: auto_backup.sh
# Description: Simulates automated database backups
# Author: sevennoteven
# ----------------------------------------------------------

# 1. Set backup directory and date
BACKUP_DIR="./backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
LOG_FILE="./backup_log.txt"

# 2. Create backup folder if not exists
mkdir -p "$BACKUP_DIR"

# 3. Simulate backup file creation
BACKUP_FILE="$BACKUP_DIR/db_backup_$DATE.sql"
echo "-- Simulated backup created on $DATE" > "$BACKUP_FILE"

# 4. Compress the backup
tar -czf "$BACKUP_FILE.tar.gz" -C "$BACKUP_DIR" "$(basename "$BACKUP_FILE")"
rm "$BACKUP_FILE"  # remove uncompressed file

# 5. Log result
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Backup created: $BACKUP_FILE.tar.gz" >> "$LOG_FILE"

# 6. Cleanup old backups (older than 7 days)
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

# 7. Log cleanup
echo "[$(date +'%Y-%m-%d %H:%M:%S')] Old backups deleted (older than 7 days)" >> "$LOG_FILE"

echo "Backup simulation completed successfully!"

echo "GitHub Acions test run successful at $(date) --Tested by Jay Gaces as part of learning and hands-on experience."

echo "Testing again because I can't still believe that I'm learning GitHub using GitBash for preparation to the future endeavor. --Jay Gaces"