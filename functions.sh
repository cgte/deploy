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

function print_ip (){
    echo "Try to connect to the following ip"
    # https://stackoverflow.com/a/54850832/7154688
    default_interface_name=$(ip route |grep default | awk '{ print $5 }')
    my_ip=$(ip route| grep "$default_interface_name" | grep -v "default" | awk '/scope/ { print $9 }')
    echo "Try to ssh to $my_ip"
}
