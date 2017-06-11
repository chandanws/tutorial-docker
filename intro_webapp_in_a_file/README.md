Web App In A File
=================    

## Run The Example

Execute...

    $ sudo docker-compose up

Then browse <https://localhost>

When you're happy you can stop and discard the containers

    $ sudo docker-compose stop
    $ sudo docker-compose rm -f

# Notes

To run mysql independently...

    $ docker run -e MYSQL_ROOT_PASSWORD=rootpwd --name dbd -d mysql:5.7.18

To run wp linked...    

    $ docker run --name wpd --link dbd:db -d wordpress:4.7.4

Mysql env variables...
* MYSQL_ROOT_PASSWORD
* MYSQL_ALLOW_EMPTY_PASSWORD
* MYSQL_RANDOM_ROOT_PASSWORD
* MYSQL_DATABASE: optional, default database

Bash on a running container

    $ docker exec -it <containerIdOrName> bash
