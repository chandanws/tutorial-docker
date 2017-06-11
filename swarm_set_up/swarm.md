# Fedora Atomic

Run three instances of Fedora Atomic.

## Run a service

On master

    $ docker service create --replicas 1 --name helloworld alpine ping docker.com

Check the service

    $ sudo docker service ls
    $ sudo docker service inspect --pretty helloworld
    ID:             bks2m13ed3346inwgl8men0iy
    Name:           helloworld
    Mode:           Replicated
     Replicas:      1
    Placement:
    UpdateConfig:
     Parallelism:   1
     On failure:    pause
    ContainerSpec:
     Image:         alpine
     Args:          ping docker.com
    Resources:

Where the service is running ?

    $ sudo docker service ps helloworld

Scale up the service    

    $ sudo docker service scale helloworld=5
    $ sudo docker service ps helloworld

Rolling update

    $ sudo docker service create --replicas 3 --name redis --update-delay 10s redis:3.0.6
    bbwil4cxovvrwkjiaiuf9glnz    

# References

## Swarm GUIs

- <https://github.com/dockersamples/docker-swarm-visualizer>
- <https://github.com/JulienBreux/docker-swarm-gui>
- <http://portainer.io/install.html>
- <https://shipyard-project.com/>

# Portainer

## In a single node

    docker run --name portainer -d -p 9000:9000 -v "/var/run/docker.sock:/var/run/docker.sock" portainer/portainer

## In swarm

    $ sudo docker service create --name portainer --publish 9000:9000 --constraint 'node.role == manager' --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock portainer/portainer -H unix:/var/run/docker.sock

    $ sudo docker service create \
        --name portainer \
        --publish 9000:9000 \
        --constraint 'node.role == manager' \
        --mount type=bind,src=/host/data,dst=/data \
        --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
        portainer/portainer \
        -H unix:///var/run/docker.sock  
