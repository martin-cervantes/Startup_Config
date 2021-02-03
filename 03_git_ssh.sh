#!/bin/bash

echo
echo "* * * * * * * * * * * * * * * * * * *"
echo "* * *   SSH-key and SSH-agent   * * *"
echo "* * * * * * * * * * * * * * * * * * *"
echo

ssh-keygen -t rsa -b 4096 -C "cervantes.martine@gmail.com"
eval "$(ssh-agent -s)"
ssh-add /home/mcervantes/.ssh/id_rsa

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   R S A   K E Y   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo

xclip -sel clip < /home/mcervantes/.ssh/id_rsa.pub

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo
echo "The SSH key was copied to the clipboard."
echo
echo "Add the new SSH key to your GitHub account"
echo

read response

ssh -T git@github.com

cd /var/www/html

git clone git@github.com:mcervantes71/Programming.git

git clone git@github.com:mcervantes71/FCC.git

cd ~/Downloads

git clone git@github.com:mcervantes71/CW.git

git clone git@github.com:mcervantes71/Android.git

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   Finish! All done!   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo
