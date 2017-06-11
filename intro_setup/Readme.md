Set Up
======

## Xubuntu VBox From Ubuntu Server

Create an Ubuntu 16.04 server vbox
* Two network card: 1 NAT, 1 Host Only

		sudo apt-get install lxde

Or better:
* <http://wiki.dennyhalim.com/ubuntu-minimal-desktop>

## Xubuntu VBox From Native Distro

Create a Xubuntu 16.04 vbox
* Two network card: 1 NAT, 1 Host Only

## Install VBox Guest Addition

	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common build-essential module-assistant

	sudo m-a prepare
	cd /media/user/VBOXADDITIONS_5.1.18_114002/
	ls
	sudo ./VBoxLinuxAdditions.run

### References

* <https://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm#22745>

### Docker

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
	$ sudo gpasswd -a ${USER} docker

### Docker compose

	$ sudo -i
	$ curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	$ sudo chmod +x /usr/local/bin/docker-compose
	$ docker-compose --version
	$ exit

## Fedora Atomic

Change hostname

On master

    $ hostnamectl set-hostname master

On worker1

    $ hostnamectl set-hostname worker1

On worker2

    $ hostnamectl set-hostname worker2

On all, set up a `docker` group to avoid using `sudo`.

		$ sudo groupadd docker
		$ sudo usermod -aG docker $USER

On master

		$ sudo docker swarm init --advertise-addr 192.168.99.100
		[sudo] password for user:
		Swarm initialized: current node (7v6u9h5pju6yv15dnckt3cfed) is now a manager.

		To add a worker to this swarm, run the following command:

		    docker swarm join \
		    --token SWMTKN-1-14bo16k0u8b67ur3pqtbiuhjwnay363ztn2sgkm5r8rtjepzv0-7mxnu0y4aq1c19qlutfis9x0j \
		    192.168.99.100:2377

		To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

On workers

		$ sudo docker swarm join --token SWMTKN-1-14bo16k0u8b67ur3pqtbiuhjwnay363ztn2sgkm5r8rtjepzv0-7mxnu0y4aq1c19qlutfis9x0j 192.168.99.100:2377


## Other software

To install atom

   sudo add-apt-repository ppa:webupd8team/atom
   sudo apt update; sudo apt install atom
