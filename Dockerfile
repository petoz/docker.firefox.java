# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2



from	ubuntu:14.04.3
#from	ubuntu:16.10
#from	ubuntu:17.04
# make sure the package repository is up to date
#run	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
run	apt-get update

# Install vnc, xvfb in order to create a 'fake' display and firefox
#run	apt-get install -y x11vnc xvfb firefox openbox
#run apt-get install -y x11vnc xvfb firefox openbox icedtea-6-plugin icedtea-netx openjdk-6-jre openjdk-6-jre-headless tzdata-java tzdata
run apt-cache search openjdk
run apt-cache search tzdata
run apt-cache search tzdata-j
run apt-get install -y x11vnc xvfb firefox openbox icedtea-plugin icedtea-netx openjdk-7-jre openjdk-7-jre-headless tzdata-java tzdata
run	mkdir ~/.vnc
# Setup a password
run	x11vnc -storepasswd 1234 ~/.vnc/passwd



# Autostart firefox (might not be the best way to do it, but it does the trick)
#run bash -c 'echo "firefox" >> ~/.bashrc'

#run bash -c 'echo "DISPLAY=:1" >> ~/.bashrc'
#run bash -c 'Xvfb :1 -screen 0 1440x900x24 &'


#run bash -c 'echo "exec openbox-session &" >> ~/.xinitrc'
#run	bash -c 'echo "firefox" >> ~/.xinitrc'
#run bash -c 'chmod 755 ~/.xinitrc'
run bash -c 'echo "Xvfb :1 -screen 0 1440x900x24 &" >> /root/.bashrc'
run bash -c 'echo "firefox --display=:1  &" >> /root/.bashrc'
run bash -c 'echo "export DISPLAY=:1" >> /root/.bashrc'
run bash -c 'echo "exec openbox-session &" >> /root/.bashrc'
run bash -c 'echo "x11vnc -display :1" >> /root/.bashrc'
