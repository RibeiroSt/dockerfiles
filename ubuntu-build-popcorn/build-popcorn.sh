#!/bin/bash
echo "Popcorn Time builder for Ubuntu in Docker"

# Clone git repository
if [ ! -d popcorn-app ]; then
	git clone https://github.com/popcorn-org/popcorn-app && echo -e "\e[1;32mOK\n\e[0m"
fi

# Check architecture
if [ -n "`arch | grep 64`" ] ; then
	#64bits
	ARCH=linux64
else
	#32bits
	ARCH=linux32
fi

# Repair broken nodejs symlink
if [ ! -e /usr/bin/node ]; then
	ln -s /usr/bin/nodejs /usr/bin/node
fi

# Install npm dependencies
cd popcorn-app/
echo "Installing npm dependencies..."
npm install && echo -e "\e[1;32mOK\n\e[0m"

# Build with grunt
echo "Building with grunt..."
grunt build && echo -e "\e[1;32mOK\n\e[0m"

echo "Moving binaries to output directory..."
mv build/releases/Popcorn-Time/$ARCH/Popcorn-Time/* ../bin && echo -e "\e[1;32mOK\n\e[0m"

exit 0
