#!/bin/bash

echo
echo "* * * * * * * * * * * * * * * * * * *"
echo "* * *   JDK Installation. . .   * * *"
echo "* * * * * * * * * * * * * * * * * * *"
echo

mkdir /opt/java

cd ..
tar -xzvf jdk-*-linux-x64.tar.gz -C /opt/java

echo "JAVA_HOME=/opt/java/jdk1.8.0_241
PATH=$PATH:$HOME/bin:/opt/java/jdk1.8.0_241/bin
export JAVA_HOME
export PATH" >> /etc/profile

source /etc/profile

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *    Configuring. . .   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo

update-alternatives --install "/usr/bin/java" "java" "/opt/java/jdk1.8.0_241/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/jdk1.8.0_241/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/java/jdk1.8.0_241/bin/javaws" 1
# update-alternatives --set java /opt/java/jdk1.8.0_241/bin/java
# update-alternatives --set javac /opt/java/jdk1.8.0_241/bin/javac
# update-alternatives --set javaws /opt/java/jdk1.8.0_241/bin/javaws
# update-alternatives --config java
# update-alternatives --config javac
# update-alternatives --config javaws
# update-alternatives --list java
# update-alternatives --list javac
# update-alternatives --list javaws

echo
echo "* * * * * * * * * * * * * * * * *"
echo "* * *   Finish! All done!   * * *"
echo "* * * * * * * * * * * * * * * * *"
echo
