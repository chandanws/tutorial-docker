Networking
==========

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

# Reference

Busybox network related commands

httpd

    httpd [-ifv[v]] [-c CONFFILE] [-p [IP:]PORT] [-u USER[:GRP]] [-r REALM] [-h HOME] or httpd -d/-e/-m STRING

    Listen for incoming HTTP requests

    Options:

            -i              Inetd mode
            -f              Do not daemonize
            -v[v]           Verbose
            -c FILE         Configuration file (default httpd.conf)
            -p [IP:]PORT    Bind to ip:port (default *:80)
            -u USER[:GRP]   Set uid/gid after binding to port
            -r REALM        Authentication Realm for Basic Authentication
            -h HOME         Home directory (default .)
            -m STRING       MD5 crypt STRING
            -e STRING       HTML encode STRING
            -d STRING       URL decode STRING

ping

    ping [OPTIONS] HOST

    traceroute

        traceroute [-FIldnrv] [-f 1st_ttl] [-m max_ttl] [-p port#] [-q nqueries]
        	[-s src_addr] [-t tos] [-w wait] [-g gateway] [-i iface]
        	[-z pausemsecs] HOST [data size]

        Trace the route to HOST

        Options:

                -F      Set the don't fragment bit
                -I      Use ICMP ECHO instead of UDP datagrams
                -l      Display the ttl value of the returned packet
                -d      Set SO_DEBUG options to socket
                -n      Print hop addresses numerically rather than symbolically
                -r      Bypass the normal routing tables and send directly to a host
                -v      Verbose
                -m max_ttl      Max time-to-live (max number of hops)
                -p port#        Base UDP port number used in probes
                                (default 33434)
                -q nqueries     Number of probes per 'ttl' (default 3)
                -s src_addr     IP address to use as the source address
                -t tos          Type-of-service in probe packets (default 0)
                -w wait         Time in seconds to wait for a response
                                (default 3 sec)
                -g              Loose source route gateway (8 max)
