# Ubuntu setup

Ubuntu Installation
  install 22.04.2 for KF series and nvidia card

Setup source list
  go to tsinghua source and setup the source, sudo apt update
  don't upgrade

Update Kernal(optional)
  http://linux.how2shout.com/linux-kernel-6-2-features-in-ubuntu-22-04-20-04/

Openssh
  ssh or open-ssh or ssh-server or sshd

Git and Github
  Install git
  Generate ssh pub key
  Put the pub key into the account
  You have to turn off proxy in this step
  `git config --global user.name ""`
  `git config --global user.email ""`
  
Install zsh
  follow up the other guide.

Install v2raycore and v2raya
  Install core
  Move the v2ray to /usr/local/bin
  Move the rest to /usr/local/share
  Install v2raya

Install Nvidia Driver
  Download Nvidia driver
  Disable the nouveau
    `sudo vim /etc/modprobe.d/blacklist.conf`
    add 
    `blacklist nouveau`
    `options nouveau modeset=0`
     update
     `sudo update-initramfs -u`
  Remove old version nv driver
    `sudo apt-get remove --purge nvidia*`
  Install dep
    `sudo apt install gcc make`
  Install
    `sudo chmod a+x NVIDIA-Linux-x86_64-535.129.03.run`
    `sudo ./NVIDIA-Linux-x86_64-535.129.03.run -no-x-check -no-nouveau-check -no-opengl-files`
    Yes for everything
  Install Cuda
    same as driver
    `export PATH=/usr/local/cuda-**/bin:$PATH`
    `export LD_LIBRARY_PATH=/usr/local/cuda-**/lib64:$LD_LIBRARY_PATH"`

Install Alist
  Run the script as root

Install Qbittorent
  `sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable`
  `sudo apt install qbittorrent`
  `sudo apt install qbittorrent-nox`

  Enable the web Service

  Enable systemd
  `sudo useradd -r -m qbittorrent`
  `sudo usermod -a -G qbittorrent YOURUSERNAME`
  `sudo nano /etc/systemd/system/qbittorrent.service`

```
[Unit]
Description=qBittorrent
After=network.target

[Service]
Type=forking
User=qbittorrent
Group=qbittorrent
UMask=002
ExecStart=/usr/bin/qbittorrent-nox -d --webui-port=8080
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
  start and enable
  
  
