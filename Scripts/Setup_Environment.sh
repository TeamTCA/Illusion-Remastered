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

# Target platform architecture check
ABI=$(getprop ro.product.cpu.abi)
ARCH="${ABI%-*}"

[[ "$ARCH" =~ 'arm64' ]] || ARCH='arm'

# Fetch the CLI according to the architecture and setup
tsudo "wget https://raw.githubusercontent.com/TeamTCA/Illusion-Remastered/3.x/Builds/"$ARCH"/tca_v3-cli -O ./tca_v3-cli"
tsu -c 'chmod a+x tca_v3-cli'
tsu -c ./tca_v3-cli
