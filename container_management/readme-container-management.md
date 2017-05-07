Container
===========

Let's see how containers can be managed with some meaningful examples.

# Exercises

# Greeting Container

Let's run a container that just keeps on printing out a welcome message.

    $ docker run busybox sh -c 'c=0; while true; do c=$(($c+1)); echo "$c hello from $(hostname), it is $(date)"; sleep 2; done'

Let's stop it with `CTRL-C`

# Multiple Running containers

Let's start multiple containers in background mode.

    $ docker run -d busybox sh -c 'while true; do echo "hello from $(hostname), it is $(date)"; sleep 2; done'
    $ docker run -d busybox sh -c 'while true; do echo "hello from $(hostname), it is $(date)"; sleep 2; done'
    $ docker run -d busybox sh -c 'while true; do echo "hello from $(hostname), it is $(date)"; sleep 2; done'        

# Playing With Multiple Containers

Check the log (aka container's stdout) with logs.

    $ docker logs -f ...

Pause and restart a container.

    $ docker pause ...
    $ docker unpause ...

Stop and start a container.

    $ docker stop ...
    $ docker start ...

Check container status

    $ docker ps ...


c=1; while true; do c=$c+1; echo "$c hello from $(hostname), it is $(date)"; sleep 2; done
