#!/bin/sh

# Set default variable values
# BACKUP_ROOT = input directories
# BACKUP_OUT = directory that tarballs are output to
BACKUP_ROOT=$(realpath "${BACKUP_ROOT:-/backup}")
BACKUP_OUT=$(realpath "${BACKUP_OUT:-/out}")

# Generate filename
archive_date=$(date +%Y-%m-%d_%H)
archive_file="$archive_date.tar.gz"

# Tar and compress all directories in BACKUP_ROOT
cd $BACKUP_ROOT

for dir in *; do
  # Check if file is a directory
  if [ -d "$dir" ]; then
    echo "Starting backup of $(realpath $dir) at $(date)"
    mkdir -p $BACKUP_OUT/$dir
    tar -cz $ARGUMENTS -f $BACKUP_OUT/$dir/$archive_file -C $BACKUP_ROOT $dir && echo "Completed backup of $(realpath $dir) at $(date)" &
  fi
done

# Wait for all archives to complete
wait
