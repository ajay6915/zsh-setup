#!/bin/bash

WEISS='\033[1;37m'
GELB='\033[1;33m'

echo -e "\n$WEISS######################################\n#$GELB  Downloade oh-my-zsh und Plug-Ins  $WEISS#\n######################################\n"
cd ~/Downloads
sleep 1
git clone https://github.com/ohmyzsh/ohmyzsh.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

echo -e "\n$WEISS######################################\n#$GELB    Installiere Powerline Shell     $WEISS#\n######################################\n"
sleep 1
sudo pip install powerline-shell

echo -e "\n$WEISS######################################\n#$GELB       Installiere oh-my-zsh        $WEISS#\n######################################\n"
sleep 1
sed -i 's/  exec zsh -l//' ~/Downloads/ohmyzsh/tools/install.sh
sleep 1
sh ~/Downloads/ohmyzsh/tools/install.sh --skip-chsh
rm -rf ~/Downloads/ohmyzsh/

sleep 1
echo -e "\n$WEISS######################################\n#$GELB      Installiere zsh-plugins       $WEISS#\n######################################\n"
mv ~/Downloads/zsh-* ~/.oh-my-zsh/plugins/
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)/' ~/.zshrc

sleep 1
echo -e "\n$WEISS######################################\n#$GELB      Stelle Shell auf zsh um       $WEISS#\n######################################\n"
chsh -s /bin/zsh $USER


echo -e "\n$WEISS######################################\n#$GELB  Richte Startoption Neofetch ein   $WEISS#\n######################################\n"
sleep 1
echo "neofetch" >> ~/.zshrc
reboot
