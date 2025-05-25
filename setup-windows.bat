echo 'For this script to work, you need to have git installed and should have cloned dotfiles repository into D:\'
echo 'Also you need to run shell as administrator'

# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Applications using Scoop
echo "Installing apps using Scoop..."
scoop bucket add main
scoop bucket add extras
scoop install 7zip
scoop install git
scoop install python
scoop install nodejs
scoop install gcc
scoop install vim
scoop install rust
scoop install autohotkey

# Install Applications using Chocolatey
echo "Installing apps using Chocolatey..."
choco install firefox
choco install vscode
choco install obsidian
choco install vlc
choco install sumatrapdf
choco install listary
choco install 7zip

choco install visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --passive --norestart"

# Install Applications using Cargo
echo "Installing apps using Cargo..."
cargo install kanata

# Install Applications using Pip
pip install ipython

# Configuring applications
echo "Configuring Vim..."
New-Item -Path C:\Users\nipun\_vimrc -ItemType SymbolicLink -Target D:\dotfiles\vimrc\.vimrc

echo "Configuring Git"
New-Item -Path ~/.gitconfig -Type SymbolicLink -Target D:\dotfiles\windows-dotfiles\.gitconfig
New-Item -Path ~/.git-credentials -Type SymbolicLink -Target D:\dotfiles\windows-dotfiles\.git-credentials

# echo "Configuring Keyboard using AHK..."
# New-Item -Path "C:\Users\nipun\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\keyboard-config.ahk" -ItemType SymbolicLink -Target D:\dotfiles\windows-dotfiles\keyboard-config.ahk

echo "Configuring Keyboard using Kanata..."
New-Item -Path "C:\Users\nipun\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\kanata-keyboard-config.bat" -Type SymbolicLink -Target D:\dotfiles\windows-dotfiles\kanata-keyboard-config.bat

# Other apps you might want to install
Write-Output @"
Here are some things that you need to do manually:
- Install few fonts from the fonts directory of our dotfiles repo

Here are some other apps you might want to install:
- Adobe Photoshop
- Adobe Illustrator
- Adobe Premiere Pro
- Adobe After Effects
- Adobe InDesign
- Microsoft Office
"@
