rclone sync ~/code gdrive:backup/code \
  --verbose \
  --progress \
  --filter-from ~/dotfiles/rclone/rclone-exclude.txt
