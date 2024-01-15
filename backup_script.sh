#!/bin/bash

# Set variables
SOURCE_DIRS=("/opt" "/var/www/html" "/etc/fstab")
BACKUP_DIR="/backup/backup/RaspberryPI_HA"
MAX_BACKUPS=5

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create a timestamp for the backup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Perform backup using rsync for each source directory
for SOURCE_DIR in "${SOURCE_DIRS[@]}"; do
  rsync -a --delete "$SOURCE_DIR" "$BACKUP_DIR/backup_${TIMESTAMP}_$(basename "$SOURCE_DIR")"
done

# Remove old backups exceeding the limit
ls -t "$BACKUP_DIR" | tail -n +$((MAX_BACKUPS+1)) | xargs -I {} rm -rf "$BACKUP_DIR/{}"
