# Space available

    $ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sda1       7,8G  7,4G   19M 100% /

# Make Up Space

## Kernel to remove

- check if you have old kernels for deletion

`ls -lh /boot`

sudo apt-get remove --purge linux-image-X.X.XX-XX-generic
If you don't know which kernel version to remove

    dpkg --get-selections | grep linux-image
    uname -r

## Other stuff

- show top 10 biggest subdirs in the current dir.

`du -sk * | sort -nr | head -10`

- use filelight or kDirStat to see where the disk space is going visually



- cleaning packages and unused language files

      sudo apt-get autoremove
      sudo apt-get autoclean
      sudo apt-get install localepurge

- see list of all installed packages, sorted by size. If you see something big and don't use it - uninstall it

      dpkg-query -W --showformat='${Installed-Size} ${Package}\n' | sort -nr | less

      sudo apt-get remove --purge \
      libreoffice libreoffice-core \
      libreoffice-common libreoffice-writer libreoffice-calc

      sudo apt-get remove --purge thunderbird

      sudo apt-get remove --purge samba-libs

      sudo apt-get remove --purge \
      linux-headers-4.8.0-36 gnome-user-guide

      sudo apt-get remove --purge \
      pidgin pidgin-data

- check content of /var/tmp/

`du -sh /var/tmp/`

- check also

`man deborphan`

- Search for big files:

`find / -type f -size +1024k`

or

`find / -size +50000  -exec ls -lahg {} \;`
