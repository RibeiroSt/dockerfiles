#!/bin/sh

OUT=$(pwd)/bin

# Create shared output directory
test -d $OUT || mkdir $OUT

# Run build container
echo "Running build container..."
docker run -v $OUT:/home/popcorn-build/bin:rw georgesapkin/ubuntu-build-popcorn /home/popcorn-build/build-popcorn.sh

if [ -n "`arch | grep 64`" ] ; then
	#64bits
	ARCH=linux64
else
	#32bits
	ARCH=linux32
fi

# chown binaries by current user
echo "chowning binaries by $USER"
sudo chown -R $USER:$USER $OUT && echo -e "\e[1;32mOK\n\e[0m"
