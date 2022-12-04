#!/bin/bash

WEISS='\033[1;37m'
GELB='\033[1;33m'

#sudo apt install -y git wget curl zsh neovim neofetch

echo -e "\n$WEISS######################################\n#$GELB  Installiere oh-my-zsh  $WEISS#\n######################################\n"
sleep 1
git clone https://github.com/ohmyzsh/ohmyzsh.git
sed -i 's/  exec zsh -l//' ./ohmyzsh/tools/install.sh
sleep 1
sh ./ohmyzsh/tools/install.sh --skip-chsh
rm -rf ohmyzsh

echo -e "\n$WEISS######################################\n#$GELB      Installiere zsh-plugins       $WEISS#\n######################################\n"
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $USER/.ohmyzsh/plugins/
git clone https://github.com/zsh-users/zsh-history-substring-search.git $USER/.ohmyzsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $USER/.ohmyzsh/plugins/
sed -i 's/plugins=(git)/plugins=(git fzf zoxide thefuck zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)/' ~/.zshrc


git clone https://github.com/romkatv/powerlevel10k.git $USER/.ohmyzsh/themes/
sed -i 's|robbyrussell|powerlevel10k/powerlevel10k|' $USER/.zshrc

sleep 1
echo -e "\n$WEISS######################################\n#$GELB      Stelle Shell auf zsh um       $WEISS#\n######################################\n"
chsh -s /bin/zsh $USER


echo -e "\n$WEISS######################################\n#$GELB  Richte Startoption Neofetch ein   $WEISS#\n######################################\n"
sleep 1
echo "neofetch" >> ~/.zshrc
#sudo reboot
