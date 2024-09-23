sudo apt update
sudo apt upgrade -y 
sudo apt install wget curl git -y 

cd ~/Downloads/

# install google chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb -y
rm ./google-chrome*.deb

# install vs code
echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


# make code folder and enable dark mode
cd $HOME
mkdir code
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# setup git 
wget https://raw.githubusercontent.com/eelias13/dotfiles/refs/heads/main/.gitconfig
ssh-keygen -t ed25519 -q -C `hostname` -f "$HOME/.ssh/id_ed25519" -N ""
echo "###########################################################################"
echo "######################### your new ssh pub key is #########################"
echo "###########################################################################"
cat $HOME/.ssh/id_ed25519.pub
