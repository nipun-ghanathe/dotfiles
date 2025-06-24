# 🛠️ Dotfiles & Linux Setup Automation

This repository contains my personal configuration files (dotfiles) for various Linux applications and tools. It also includes automated setup scripts to quickly configure a fresh Linux installation using `gnu-stow`.

---

## 📁 What's Inside

* **Dotfiles** for tools like `bash`, `zsh`, `neovim`, `sway`, `waybar`, `kitty`, and more.
* **Setup scripts** (e.g. `setup-debian.sh`) to automate the installation of packages, system configuration, and symlink management.
* **Modular structure** compatible with `stow` for clean, maintainable configuration.

---

## ⚙️ Automated Setup (Recommended)

To automate your environment setup on a freshly installed Linux system, follow these steps:

### 1. Ensure your user has sudo privileges

Check if your user is in the `sudo` group:

```bash
groups $USER
```

If not, switch to the root user and add them:

```bash
su -
usermod -aG sudo <your-username>
```

Log out and back in, or reboot for the changes to take effect.

---

### 2. Connect to the internet

Ensure you have a working internet connection.

---

### 3. Install Git

On Debian-based systems:

```bash
sudo apt update
sudo apt install git
```

---

### 4. Clone this repository

Clone the repo into `~/dotfiles`:

```bash
git clone https://github.com/nipun-ghanathe/dotfiles.git ~/dotfiles
```

---

### 5. Run the setup script

Make the script executable and run it. For example, on Debian:

```bash
chmod +x ~/dotfiles/setup-debian.sh
~/dotfiles/setup-debian.sh
```

This will install required packages, symlink configuration files using `stow`, and set up your preferred environment.

---

### 6. Manual setup that needs to be done

**🔐 Configure rclone (Google Drive)**
- Rclone is installed and a boilerplate config file is placed at:
  `~/.config/rclone/rclone.conf`
- Secrets are not included. Retrieve them from Bitwarden:
  - Open the rclone-gdrive-api note in your Bitwarden vault.
  - Copy the values for CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN, and TOKEN_EXPIRY.
  - Replace the corresponding placeholders in the config file.
- To verify it works:
  ```bash
  rclone ls gdrive:
  ```
- For more information check `~/dotfiles/rclone/README.md`

---

## 🧰 Notes

* The setup scripts are tailored to specific distributions (e.g. Debian). Make sure you use the correct one.
* Some actions (e.g. adding kernel modules, configuring `uinput`) may require a reboot to take full effect.
* Your original configs (e.g. `.bashrc`) may be replaced by symlinks to the repo versions — back up if needed.


# 📝 To-dos
***These changes will be done in June of 2026***

- [ ] Check whether or not `ruff` config is even working inside `neovim`
- [ ] Changes in Neovim
    - [ ] Debloat the config
    - [ ] Replace `nvim-lspconfig` by `vim.lsp`  
      Example:
      ```lua
      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            -- Ruff language server settings go here
          }
        }
      })
      
      vim.lsp.enable('ruff')
      ```
    - [ ] Remove `mason` and install LSPs, Formatters and Linters
      globally
    - [ ] See if you can remove `none-ls`, `conform` and `nvim-lint`
    - [ ] See if you can remove `venv-selector`
    - [ ] Rewrite the whole config
- [ ] Make setup-debian.sh better
  - [x] Lay a blueprint for modularizing
  - [ ] Add improvements
  - [ ] Modularize it
- [ ] Improve `bashrc` by referring to the `zshrc`
