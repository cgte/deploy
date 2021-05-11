prefix="https://raw.githubusercontent.com/cgte/deploy/main"

mkdir _deploy && cd _deploy

curl "$prefix/functions.sh" --output functions.sh
curl "$prefix/prepare_install.sh" --output install.sh
