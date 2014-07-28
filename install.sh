#!/usr/bin/env bash

APPLICATION="vagrantBootstrap"
VERSION="0.0.1"

# http://stackoverflow.com/a/3182519/715002
USAGE="Usage: $APPLICATION [-hv] branch

  Arguments:
    branch        The vagrantBootstrap repository branch to download

  Options:
    -h        Print this help screen
    -v        Print version

Version $VERSION"

function usage() {
  echo "$USAGE" >&2
}

# Parse command line options.
while getopts hvo: OPT; do
  case "$OPT" in
    h)
      usage
      exit 0
      ;;
    v)
      echo "$APPLICATION - Version $VERSION"
      exit 0
      ;;
    \?)
      # getopts issues an error message
      usage
      exit 1
      ;;
  esac
done

# Remove the switches we parsed above.
shift `expr $OPTIND - 1`

# We want at least one non-option argument. 
if [ ! $# -eq 1 ]; then
  usage
  exit 1
fi

# Access additional arguments as usual through 
# variables $@, $*, $1, $2, etc. or using this loop:
# PARAM=$@
# for PARAM; do
#   echo $PARAM
# done

cwd=$(pwd)
src='tmp'
branch=$1

mkdir $src

echo "Downloading $branch into $src..."
cd $src
wget https://github.com/endorama/vagrantBootstrap/archive/$branch.zip -O vagrantBootstrap.zip -q
unzip vagrantBootstrap.zip > /dev/null

echo "Copying files to $cwd"
cp vagrantBootstrap-$branch/Vagrantfile $cwd/
cp vagrantBootstrap-$branch/vagrant.tpl.json $cwd/vagrant.json
cp -r vagrantBootstrap-$branch/.vagrant $cwd/

echo "Adding to gitignore"
cat vagrantBootstrap-$branch/.gitignore >> $cwd/.gitignore

echo "Cleaning up"
cd ..
rm -r $src

# EOF