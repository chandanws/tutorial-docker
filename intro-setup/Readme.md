Set Up
======

## Xubuntu VBox

Create a Xubuntu 16.04 vbox 
* Two network card: 1 NAT, 1 Host Only

Install VBox Guest Addition

	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
	sudo apt-get install build-essential module-assistant
	sudo m-a prepare
	cd /media/user/VBOXADDITIONS_5.1.18_114002/
	ls
	sudo ./VBoxLinuxAdditions.run

## Docker

Install Docker. Reference: <https://unix.stackexchange.com/questions/363048/unable-to-locate-package-docker-ce-on-a-64bit-ubuntu>

	$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
	$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
	$ sudo apt-get update

Run the following

	$ sudo apt-get install docker-ce
	$ sudo docker run hello-world

Set up a `docker` group to avoid using `sudo`.

	$ sudo groupadd docker
	$ sudo usermod -aG docker $USER

## Docker compose

	$ sudo -i
	$ curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	$ sudo chmod +x /usr/local/bin/docker-compose
	$ docker-compose --version
	$ exit

## Install an editor

To install atom

   sudo add-apt-repository ppa:webupd8team/atom
   sudo apt update; sudo apt install atom

