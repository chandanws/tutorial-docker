How to set proxy and other network related stuff
================================================



## Fix DNS name resolution

Change the `/etc/nsswitch.conf` file.
In the line starting with `hosts:`, `dns` should appear before
`mdns4_minimal [NOTFOUND=return]`. For instance:

```
# /etc/nsswitch.conf
#
# Example configuration of GNU Name Service Switch functionality.
# If you have the `glibc-doc-reference' and `info' packages installed, try:
# `info libc "Name Service Switch"' for information about this file.

passwd:         compat
group:          compat
shadow:         compat
gshadow:        files

hosts:          files dns mdns4_minimal [NOTFOUND=return] 
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis
```



## Configure Docker to use the proxy

Create a Docker configuration file in a specific folder

```
sudo mkdir -p /etc/systemd/system/docker.service.d

cat <<EOF >> /tmp/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://<the-proxyhost>:<the-proxy-port>/" "NO_PROXY=localhost,127.0.0.1"
EOF

sudo mv /tmp/http-proxy.conf /etc/systemd/system/docker.service.d/
```

Restart Docker to make it reload the configuration file.

```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

Check that Docker actually read the new configuration.

```
sudo systemctl show --property Environment docker
```



## Configure a Proxy for Shell Commands

```
cat <<EOF >> /tmp/profile-d-proxy.sh
export http_proxy=http://<the-proxyhost>:<the-proxy-port>/
export https_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
EOF

sudo mv /tmp/profile-d-proxy.sh /etc/profile.d

sudo source /etc/profile
```



## Configure Proxy for apt-get

```
cat <<EOF >> /tmp/99proxy
Acquire::http::Proxy "http://<the-proxyhost>:<the-proxy-port>/";
EOF

sudo mv /tmp/99proxy /etc/apt/apt.conf.d
```

## References
* https://stackoverflow.com/questions/23111631/cannot-download-docker-images-behind-a-proxy#28093517
* https://docs.docker.com/engine/admin/systemd/#httphttps-proxy
* https://blog.codeship.com/using-docker-behind-a-proxy/
* https://www.guidalinux.com/usare-apt-get-in-una-rete-con-proxy/

