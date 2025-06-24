rclone sync ~/code gdrive:backup/code \
  --verbose \
  --progress \
  --exclude **/.venv/** \
  --exclude **/.mypy_cache/** \
  --exclude **/.ipynb_checkpoints/** \
  --exclude **/.pytest_cache/**

rclone sync ~/obsidian-vault gdrive:backup/obsidian-vault \
  --verbose \
  --progress
