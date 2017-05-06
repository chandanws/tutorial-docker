Container
===========

Let's see how containers works with some meaningful examples.

## Exercises

### OPS! Ubuntu 16:04 does not have a netcat installed!

### A Simple Daemon

The `nc -lp <port>` commands listen for incoming messages and prints them.

The `nc <destination> <port>` can be used to send a message.

So let's start a `nc` server.

    $ docker run -d busybox nc -ll

How can we send it a message ? Well let's say we cannot because we didn't
tell docker what port this container will use.

    $ docker run -d -p 12345 busybox nc -ll -p 12345

    $ docker run -d -p 12345 ubuntu:16.4 nc -l -k -p 12345

    $ docker ps

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                      NAMES
    4e72669246cc        busybox             "nc -ll 12345"      4 seconds ago       Up 3 seconds        0.0.0.0:32768->12345/tcp   confident_thompson

We can send it a message!

    $ nc 127.0.0.1 32768
