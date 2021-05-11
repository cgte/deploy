function update_arch (){
    echo "update_arch"
    # Make this call optional
    sudo pacman -Syu
}

function install_arch (){
   echo "Installing for arch"
   packages="openssh"
   sudo pacman -S "$packages"
}

function activate_arch (){
   echo "starting and enabling services"
   sudo systemctl start sshd.service && sudo systemctl enable sshd.service
}
