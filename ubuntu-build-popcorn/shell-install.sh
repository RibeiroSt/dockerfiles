#!/bin/bash

#information
echo "
Popcorn-Time Beta 2 for Ubuntu-Linux
------------------------------------
WARNING: Popcorn Time streams movies from Torrents. Downloading copyrighted material may be illegal in your country. Use at your own risk.
"

#verify awareness
read -p "Do you wish to install Popcorn Time [y/n] ? "
if [ "$REPLY" == "y" ] ; then
 sudo echo -e "\nThis may take a while...\n"
else
 exit 0
fi

#dependencies install
echo "- Installing dependencies from repositories..."
# sudo add-apt-repository -y ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get install nodejs git wget npm -y && echo -e "...Ok.\n"

#npm install for CLI
echo "- Installing CLI from 'npm'..."
# sudo npm install -g grunt-cli && echo -e "...Ok.\n"

#git clone
echo "- Cloning GITHUB repository..."
git clone https://github.com/popcorn-official/popcorn-app.git && echo -e "...Ok.\n"

#configure
cd popcorn-app/
    #check architecture
    if [ -n "`arch | grep 64`" ] ; then
        #64bits
        ARCH=linux64
    else
        #32bits
        ARCH=linux32
        sed -i 's/linux32: false/linux32: true/g' Gruntfile.js
        sed -i 's/linux64: true/linux64: false/g' Gruntfile.js
    fi
    sed -i 's/mac: true/mac: false/g' Gruntfile.js
    sed -i 's/win: true/win: false/g' Gruntfile.js


#repair broken nodejs symlink
sudo ln -s /usr/bin/nodejs /usr/bin/node

#install NPM dependencies
echo "- Installing NPM dependencies..."
sudo npm install -g grunt-cli && echo -e "...Ok.\n"
sudo npm install && echo -e "...Ok.\n"

#build with grunt
echo "- Building with 'grunt'..."
sudo grunt nodewkbuild && echo -e "...Ok.\n"

#Copy program into /opt
echo "- Installing Popcorn-Time in '/opt/Popcorn-Time/'"
cd build/releases/Popcorn-Time/$ARCH/
sudo mkdir /opt
sudo cp -r Popcorn-Time /opt
sudo chmod +x /opt/Popcorn-Time/Popcorn-Time
sudo ln -s /opt/Popcorn-Time/Popcorn-Time /usr/bin/popcorn-time && echo "...Ok.\n"

#fixing libudev
if [ "$ARCH" == "linux64" ] ; then
 sudo ln -s /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
elif [ "$ARCH" == "linux32" ] ; then
 sudo ln -s /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0
fi

#testing app
echo "The application 'Popcorn-Time' will now be tested for 5 secondes.
"
/usr/bin/popcorn-time &
sleep 5
killall Popcorn-Time
read -p "
Did you see the Popcorn-Time application ?
If yes, do you wish to remove all the unecessary files now that the program works [y/n] ? "
if [ "$REPLY" == "y" ] ; then
    #remove building files
    echo "- Removing building files now unwanted..."
    cd ../../../../..
    sudo rm -r popcorn-app && echo -e "...Ok.\n"
fi

#create launcher
echo "- Creating launcher/shortcut in '/usr/share/applications/'..."
echo "[Desktop Entry]
Comment=Watch movies in streaming with P2P.
Name=Popcorn Time
Exec=/usr/bin/popcorn-time
StartupNotify=false
Type=Application
Icon=totem" | sudo tee /usr/share/applications/popcorn-time.desktop
sudo chmod +x /usr/share/applications/popcorn-time.desktop && echo -e "...Ok.\n"

echo "
Installation done ! Popcorn-time should be now available through :
- Dash
- Commandline 'popcorn-time'"

exit 0