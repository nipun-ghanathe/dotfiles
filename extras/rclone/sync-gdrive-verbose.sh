#!/bin/bash

rclone sync /home/nipun/code gdrive:backup/code \
  --verbose \
  --progress \
  --exclude '**/.venv/**' \
  --exclude '**/__pycache__/**' \
  --exclude '**/.mypy_cache/**' \
  --exclude '**/.ipynb_checkpoints/**' \
  --exclude '**/.pytest_cache/**'

rclone sync /home/nipun/obsidian-vault gdrive:backup/obsidian-vault \
  --verbose \
  --progress

