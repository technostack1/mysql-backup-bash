#!/bin/bash

# ===== LOAD CREDENTIALS =====
if [ -f /opt/secret/cred ]; then
    source /opt/secret/cred
else
    echo "[ERROR] Credentials file /opt/secret/cred not found!"
    exit 1
fi

# ===== CONFIGURATION =====
BACKUP_DIR="/path/to/backup_dir"    # Where to store backups locally
GIT_REPO_DIR="/path/to/your/repo"   # Path to your local cloned GitHub repo
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
SQL_FILE="${DB_NAME}_${TIMESTAMP}.sql"
ZIP_FILE="${DB_NAME}_${TIMESTAMP}.zip"

# ===== STEP 1: Create MySQL dump =====
echo "[INFO] Creating MySQL dump..."
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/$SQL_FILE"

if [ $? -ne 0 ]; then
    echo "[ERROR] mysqldump failed!"
    exit 1
fi

# ===== STEP 2: Zip the dump =====
echo "[INFO] Compressing SQL dump..."
cd "$BACKUP_DIR" || exit
zip -r "$ZIP_FILE" "$SQL_FILE"
rm "$SQL_FILE"  # Remove raw SQL after zipping

# ===== STEP 3: Copy to Git repo =====
echo "[INFO] Moving backup to Git repo..."
cp "$BACKUP_DIR/$ZIP_FILE" "$GIT_REPO_DIR/"

# ===== STEP 4: Commit & push =====
cd "$GIT_REPO_DIR" || exit
git add "$ZIP_FILE"
git commit -m "Backup: $ZIP_FILE"
git push origin main  # Change 'main' to your backup branch if needed

echo "[INFO] Backup complete and pushed to GitHub."
