#!/data/data/com.termux/files/usr/bin/bash env

########################################
#  TCA CLI Environment Setup Script version: 3.0
########################################
#
#  Author: The Illusionist <T.me/Theillusionist_TCA> and Josh <T.Me/IAmJoshBrolin>
#
########################################
#
# Dependencies: bash and curl.
#
########################################

# Update and upgrade
pkg up -y && pkg upgrade -y

# Switch permissive
su -c 'setenforce 0'

# Install dependencies
time apt install rsync aapt neofetch toilet ncurses-utils tsu openssl-tool ruby wget ccrypt dialog -y

# Install LOLCat via Ruby's package manager
gem install lolcat

# Remove existing files
tsu -c 'find . -iname '*tca*' -exec rm -rf {} \;'

# Fetch the CLI according to the architecture
ABI=`getprop ro.product.cpu.abi`
if [ "$ABI" = "x86" ];then
    wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/3.x/Builds/x86/tca_v3-cli -O ./tca_v3-cli;
elif [ "$ABI" = "x86_64" ];then
    wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/3.x/Builds/x86_64/tca_v3-cli -O ./tca_v3-cli;
elif [ "$ABI | cut -c-3" = "arm" ];then
    wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/3.x/Builds/arm/tca_v3-cli -O ./tca_v3-cli;
elif [ "$ABI | cut -c-5" = "arm64" ];then
    wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/3.x/Builds/arm64/tca_v3-cli -O ./tca_v3-cli;
fi

# Setup
tsu -c 'chmod a+x tca_v3-cli'
tsu -c ./tca_v3-cli
