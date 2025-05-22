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

## 🧰 Notes

* The setup scripts are tailored to specific distributions (e.g. Debian). Make sure you use the correct one.
* Some actions (e.g. adding kernel modules, configuring `uinput`) may require a reboot to take full effect.
* Your original configs (e.g. `.bashrc`) may be replaced by symlinks to the repo versions — back up if needed.
