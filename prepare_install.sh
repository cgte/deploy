echo "Hello world"

os_info="/etc/os-release" # Contains info about your distro eg arch or debian based

arch_like="arch"


echo "fetching info for $os_info"

if [[ ! -e "$os_info" ]];
    then
        echo "could not find $os_info , exiting";
        exit 1
    else
        echo "$os_info found"
fi

distro_like_line=$(grep "^ID_LIKE=" $os_info)
if [[ -n "$distro_like_line" ]];
then
    echo "Found distro like info"
else
    echo "Could not find which distro to use as base, exiting"
    exit 2
fi

distro_like=$(echo "$distro_like_line" | cut -d= -f 2) # xxx=my_base ~> my_base

source ./functions.sh

echo "your seems to be based on $distro_like"

if [[ "$distro_like" == "$arch_like" ]];
    then
        install_arch
fi
