Hello World
===========

This is just used to make practice with the command line `docker`,
how to launch a container, how to inspect its status.

## Exercises

### Hello World

Start the hello-world container

    $ docker run hello-world

Inspect the container.

    $ docker ps -a

You got something like:

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    8637fa13b49e        hello-world         "/hello"            30 seconds ago      Exited (0) 29 seconds ago                       unruffled_bartik

### Bash in a Container

Let's start a bash in a ubuntu container.

    $ docker run -it ubuntu:16.04 bash

Let's play around with it.   

    $ mkdir -p /tmp/test
    $ touch /tmp/test/hello.txt
    $ hostname
    $ cat /etc/hosts
    $ exit
