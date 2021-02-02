#!/bin/bash

echo
echo "* * * * * * * * * * * * * * * * * * *"
echo "* * *   StartUp Configuration   * * *"
echo "* * * * * * * * * * * * * * * * * * *"
echo

cd ..
ORIGIN=$(pwd)

gsettings set org.gnome.settings-daemon.plugins.power button-power 'suspend'
gsettings get org.gnome.settings-daemon.plugins.power button-power

mkdir /home/mcervantes/misProgramas

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "* * *   Enabling Ubuntu Software Repositories   * * *"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo

#To enable main repository,
add-apt-repository main

#To enable universe repository,
add-apt-repository universe

#To enable multiverse repository,
add-apt-repository multiverse

#To enable restricted repository,
add-apt-repository restricted

echo
echo "* * * * * * * * * * * * * * * * * *"
echo "* * *   Adding Repositories   * * *"
echo "* * * * * * * * * * * * * * * * * *"
echo

echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
cd /opt
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"


echo
echo "* * * * * * * * * * * * * * * * * * *"
echo "* * *   Updating and Upgrading   * * *"
echo "* * * * * * * * * * * * * * * * * * *"
echo

apt update && apt upgrade -y && apt autoremove -y

echo
echo "* * * * * * * * * * * * * * * * * * * * *"
echo "* * *   Removing Programs Not Used   * * *"
echo "* * * * * * * * * * * * * * * * * * * * *"
echo

apt purge libreoffice* -y
apt purge openoffice* -y

echo
echo "* * * * * * * * * * * * * * * * * * *"
echo "* * *   Programs Installation   * * *"
echo "* * * * * * * * * * * * * * * * * * *"
echo


## WPS Office
echo "===> WPS Office"
cd $ORIGIN
apt install ./wps-office*amd64.deb -y
mv ~/Desktop/wps-office* /opt/kingsoft/wps-office/

## Multi Writer USB Installation
echo "===> Multi Writer USB"
apt install gnome-multi-writer -y

## Wine - Windows Emulator
#echo "===> Wine -- Windows Emulator"
#apt install wine-stable -y

### Media Codecs
echo "===> Media Codecs"
apt install ubuntu-restricted-extras -y


### web tools
echo "===>  Installing LAMP"
apt install apache2 -y
apt install mysql-server -y

echo
echo "copy to the clipboard."
echo
echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P4ssw0rd55';"
echo "FLUSH PRIVILEGES;"
echo "exit"
read response
mysql

apt install phpmyadmin -y
apt install nodejs npm -y
apt install python3-pip -y
apt install sqlite3 libsqlite3-dev -y

echo "<!DOCTYPE html>
<html>
    <head>
        <title>PHP Info</title>
    </head>
    <body>
        <?php echo phpinfo(); ?>
    </body>
</html>" >> /var/www/html/index.php

ln -s /var/www/html /home/mcervantes/Desktop

## Webmin
echo "===> Installing Webmin"
apt install webmin -y

## MyApps
echo "===> Installing MyApps"
apt install gnome-tweak-tool -y
apt install rar unrar zip unzip -y
apt install gnome-control-center gnome-online-accounts -y
apt install plank gimp gparted screenfetch -y
apt install gnome-shell-pomodoro -y
apt install gnome-mines -y
apt install vlc -y
apt install mame* joystick xboxdrv jstest-gtk -y
cp -R roms ~/misProgramas/
cp -R snapshots ~/misProgramas/

### git
echo "===> Installing Git"
apt install git -y
git config --global color.ui auto
git config --global user.name "Martin Cervantes"
git config --global user.email "cervantes.martine@gmail.com"
git --version
git config --list

apt install xclip -y


## developing
### compilers and IDEs

echo
echo "* * *   C H R O M I U M   * * *"
echo

apt install chromium-browser -y
apt install firefox -y

echo
echo "* * *   Zoom   * * *"
echo
cd $ORIGIN
apt install ./zoom_amd64.deb -y

echo
echo "* * *   GitKraken   * * *"
echo
cd $ORIGIN
apt install ./gitkraken-amd64.deb -y

echo
echo "* * *   VNC-Viewer   * * *"
echo
cd $ORIGIN
apt install ./VNC-Viewer-*-Linux-x64.deb -y

echo
echo "* * *   A T O M :D   * * *"
echo
apt install ./atom-amd64.deb -y

echo
echo "* * *   Arduino Studio   * * *"
echo
mkdir /home/mcervantes/misProgramas/Arduino
apt install arduino -y
chmod a+rw /dev/ttyACM0

echo
echo "* * *   PyCharm   * * *"
echo
tar -xzvf $ORIGIN/pycharm-*.tar.gz -C /opt
cd /opt/pycharm-*/bin
sh pycharm.sh

echo
echo "* * *   JavaFX SceneBuilder   * * *"
echo
cd $ORIGIN
apt install ./javafx_scenebuilder-2_0-linux-x64.deb -y

echo
echo "* * *   Android Studio   * * *"
echo
mkdir /home/mcervantes/misProgramas/SDK
mkdir /home/mcervantes/misProgramas/Android
tar -xzvf $ORIGIN/android-studio-ide-*-linux.tar.gz -C /opt
cd /opt/android-studio/bin
sh studio.sh

#echo
#echo "* * *   NetBeans   * * *"
#echo
#cd $ORIGIN
#sh netbeans-8.2-linux.sh
#mkdir /home/mcervantes/misProgramas/NetBeansProjects
#echo "StartupWMClass=NetBeans IDE 8.2" \ | tee -a /usr/share/applications/netbeans-8.2.desktop

echo
echo "* * * * * * * * * * * *"
echo "* * *   Cleaning   * * *"
echo "* * * * * * * * * * * *"
echo

chown -R mcervantes:mcervantes /opt
chown -R mcervantes:mcervantes /var/www/html
chown -R mcervantes:mcervantes ~/Desktop/html
chown -R mcervantes:mcervantes /home/mcervantes/misProgramas

# SOLO PARA UBUNTU BUDGIE
# ROTATION LOCK SCREEN
# gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

apt autoclean

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   Finish! All done!   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo
