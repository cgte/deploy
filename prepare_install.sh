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

echo "your seems to be based on $distro_like"

sudo id > /dev/null && sudo_ok=1 || sudo_ok=0

if [[ -z sudo_ok ]];
then
    echo "sudo failed exiting"; exit
else
    echo "sudoing ok"
fi

source ./functions.sh
check_import

set -x
echo dis "$distro_like"
echo arch "$arch_like"


if [ $distro_like = "$arch_like" ];
then
    echo "Processing for arch"
    update_arch
    install_arch
    activate_arch
    print_ip
else
    echo "no work"
fi
