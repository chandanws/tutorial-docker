Dockerized App
==============

Goal of this exercise is to show the main workflows to Dockerize an app through a Dockerfile.

In order to avoid problems with proxies the app we're going to dockerize is
extremely simple.
It is an app that keeps on writing the same message over and over, both on stdout
and in file.

    export GREET_PAUSE=2
    export GREET_MESSAGE="Hello!"
    mkdir -p /tmp/greetings
    c=0; while true; do c=$(($c+1)); echo "$c from $(hostname), it is $(date): $GREET_MESSAGE"; sleep $GREET_PAUSE; done | tee /tmp/greetings/greetings.txt

So, let's build the `Dockerfile`.

Then let's build the corresponding image.

    $ docker build -t greeter:1.0 .

Then let's start a container based on the image.

    $ docker run --rm greeter:1.0

Then let's start a container changing the set up. First of all let's check the container env.

    $ docker run --rm greeter:1.0 env

It is possible to change the environment.

    $ docker run -e "GREETING_PAUSE=5" -e "GREETING_MESSAGE=Ciao" --rm greeter:1.0 env

Now we can personalize it.

    $ docker run --name greet --rm -e "GREETING_PAUSE=5" -e "GREETING_MESSAGE=Ciao" greeter:1.0

Then we can configure the container to write locally

    $ mkdir -p /tmp/containers/storage
    $ docker run --name greet --rm -v /tmp/containers/storage:/tmp/greetings/ greeter:1.0

We can combine things together

    $ docker run --name itagreet -d -v /tmp/containers/storage:/tmp/greetings/ -e "GREETING_PAUSE=3" -e "GREETING_MESSAGE=Ciao" greeter:1.0
    $ docker run --name espgreet -d -v /tmp/containers/storage:/tmp/greetings/ -e "GREETING_PAUSE=4" -e "GREETING_MESSAGE=Hola" greeter:1.0

## Notes

docker run busybox sh -c 'c=0; while true; do c=$(($c+1)); echo "$c hello from $(hostname), it is $(date)"; sleep 2; done'