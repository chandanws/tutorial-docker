Web App In A File
=================    

Run the app

    $ sudo docker-compose up

The database can be reached at link name. So, the data to connect to the db are:
* db name: wordpress
* db user name: root
* db user pwd: rootpwd
* db host: database
* table prefix: wp_

# Notes

To run mysql

    $ docker run -e MYSQL_ROOT_PASSWORD=rootpwd --name dbd -d mysql:5.7.18

To run wp linked    

    $ docker run --name wpd --link dbd:db -d wordpress:4.7.4

Env variables
* MYSQL_ROOT_PASSWORD
* MYSQL_ALLOW_EMPTY_PASSWORD
* MYSQL_RANDOM_ROOT_PASSWORD

* MYSQL_DATABASE: optional, default database

Bash on a running container

    $ docker exec -it <containerIdOrName> bash
