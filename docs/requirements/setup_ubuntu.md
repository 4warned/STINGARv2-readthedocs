STINGAR System - Ubuntu Installation
===============

This page describes how to install software that STINGAR needs to run on an Ubuntu server. If possible, upgrade to Ubuntu 18.04 or higher. (We tested STINGAR installations on Ubuntu v16 and ran into a number of issues related to software dependencies with incompatible versions.)

#Install Docker & Python

Log onto the Ubuntu server as the STINGAR admin user (has root privs), then install and launch the software you need to setup and run run STINGAR. Once logged in, enter the following commands:

```
sudo apt update
sudo apt upgrade -y
sudo apt install docker docker-compose python3 gcc pass -y
sudo systemctl enable docker --now
sudo systemctl start docker
```

#Setup Docker Group
A system group named 'docker' must include the STINGAR user (ie. the user you're currently logged in as). Run the following commands to create a group named 'docker' & add yourself (the current user).

```
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chown ${USER} /var/run/docker.sock
```

Note: Use the actual string: ${USER}. This automatically converts to the name of the user who ran the command.


<div style="font-weight:bold">IMPORTANT: Before proceeding, you must logout & back in.</div>

<style>
button {
  color: #ffffff;
  background-color: #2f75bc;
  padding: .5em .8em;
  border-radius: 3px;
  border: none;
}
button:hover {
  background-color: #757475;
}
a {
  color: white;
}
a:visited, a:hover {
  color: white;
}
</style>

<button style="margin-top:3em;float:right;">[Proceed to Next Step](confirm.md)</button>

