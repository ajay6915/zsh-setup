#!/bin/bash


if [ -f /bin/apt ]; then
	sudo apt install -y fzf zoxide thefuck
elif [ -f /bin/pacman ]; then
	sudo pacman -S fzf zoxide thefuck
else echo "fzf, zoxide and thefuck have to be installed"
fi

echo -e "\n######################################\n#  Installing oh-my-zsh  #\n######################################\n"
sleep 1
git clone https://github.com/ohmyzsh/ohmyzsh.git
sed -i 's/  exec zsh -l//' ./ohmyzsh/tools/install.sh
sleep 1
sh ./ohmyzsh/tools/install.sh --skip-chsh
rm -rf ohmyzsh

echo -e "\n######################################\n#      Installing zsh-plugins       #\n######################################\n"
cd /home/$USER/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-history-substring-search.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sed -i 's/plugins=(git)/plugins=(git fzf zoxide thefuck zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)/' ~/.zshrc

cd /home/$USER/.oh-my-zsh/themes
git clone https://github.com/romkatv/powerlevel10k.git 
sed -i 's|robbyrussell|powerlevel10k/powerlevel10k|' /home/$USER/.zshrc

sleep 1
echo -e "\n######################################\n#      Changing shell to zsh       #\n######################################\n"
chsh -s /bin/zsh $USER


echo -e "\n######################################\n#  Adding Neofetch to .zshrc   \n######################################\n"
sleep 1
echo "neofetch" >> ~/.zshrc
#sudo reboot
