#!/bin/bash

WEISS='\033[1;37m'
GELB='\033[1;33m'

sudo apt install -y wget curl zsh neovim neofetch python3-pip

echo -e "\n$WEISS######################################\n#$GELB  Installiere oh-my-zsh  $WEISS#\n######################################\n"
sleep 1
git clone https://github.com/ohmyzsh/ohmyzsh.git
sed -i 's/  exec zsh -l//' ./ohmyzsh/tools/install.sh
sleep 1
sh ./ohmyzsh/tools/install.sh --skip-chsh
rm -rf ohmyzsh

echo -e "\n$WEISS######################################\n#$GELB      Installiere zsh-plugins       $WEISS#\n######################################\n"
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions.git
sed -i 's/plugins=(git)/plugins=(git zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)/' ~/.zshrc

cd ~/.oh-my-zsh/themes
git clone https://github.com/romkatv/powerlevel10k.git
sed -i 's|robbyrussell|powerlevel10k/powerlevel10k|' ~/.zshrc

echo -e "\n$WEISS######################################\n#$GELB    Installiere Powerline Shell     $WEISS#\n######################################\n"
sleep 1
#sudo pip install powerline-shell

sleep 1
echo -e "\n$WEISS######################################\n#$GELB      Stelle Shell auf zsh um       $WEISS#\n######################################\n"
chsh -s /bin/zsh $USER


echo -e "\n$WEISS######################################\n#$GELB  Richte Startoption Neofetch ein   $WEISS#\n######################################\n"
sleep 1
echo "neofetch" >> ~/.zshrc
#sudo reboot
