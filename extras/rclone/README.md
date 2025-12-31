### Introduction

Rclone can be automatically installed through `setup/main.sh` or
`setup/other-tools.sh`.\
Additionally a boilerplate config file will be copied to
`~/.config/rclone/rclone.conf` where secrets will be replaced by some
placeholders.
It is rather recommended to do a fresh start, and use OAuth to provide the key
and other things. You just need to run the following command and the required
configuration file would be generated:

```bash
# Syntax: rclone config create <name> <type>
rclone config create gdrive drive
```

To automate cloning either use cronjob or systemd daemon:
For using systemd daemon, stow the systemd directory from dotfiles and then
run the following commands:

```bash
systemctl --user daemon-reload
systemctl --user enable --now drive_backup.timer
```

For cron, run `crontab /path/to/crontab-file`. crontab file is in dotfiles repo.

You will need to configure rclone and connect your google drive to use it. See
[Configuration](#Configuration) section below for that.

### Solving problems

If you get something like:

```
Failed to refresh token: oauth2: token expired and refresh token is not set
```

or:

```
Failed to get token: oauth2: cannot fetch token: 400 Bad Request
```

then you would need to re-authenticate using:

```bash
rclone config reconnect gdrive:
```

Test if re-authentication was successful or not by running something like:

```bash
rclone ls gdrive:
```

### Configuration

**Method-1:** Copy file `~/dotfiles/extras/rclone/rclone.conf` to
`~/.config/rclone/rclone.conf` and then replace the placeholders with the actual
keys which you can find in your BitWarden vault's rclone-gdrive-api note.

**Method-2:** Run `rclone config` and do the config. Make sure to enter our own
Client ID and Client Secret for faster syncing. You can find those in our
BitWarden vault's rclone-gdrive-api note.
