Images
======

Let's see how is it possible to create a new image with the two main
workflows provided by Docker:
* with `docker commit` command;
* with a `Dockerfile`.

## Exercises

### An _ubuntu:16.04_ With Netcat Using Docker Commit

_OPS! Ubuntu 16:04 does not have a netcat installed!_

We are going to create a container that has it.

    $ docker run -it ubuntu:16.04 bash
    # nc
    bash: nc: command not found
    # apt-get update
    # apt-get install netcat
    # exit
    $ docker commit silly_heisenberg netcat-handmade
    sha256:09b4beb952317f6f238bfd42123ce29becbdc608e7e6a14bf2dcd208f7e4571c
    $ docker image ls
    REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
    netcat-handmade                         latest              09b4beb95231        3 minutes ago       156 MB


### An _ubuntu:16.04_ With Netcat Available Using a Dockerfile

_OPS! Ubuntu 16:04 does not have a netcat installed!_

Let's prepare a Dockerfile.

Let's build the new image with:

    $ docker build --tag netcat:latest .
    $ docker image ls
    REPOSITORY                              TAG                 IMAGE ID            CREATED             SIZE
    netcat                                  latest              45ad60d8eb6c        26 hours ago        156 MB    
