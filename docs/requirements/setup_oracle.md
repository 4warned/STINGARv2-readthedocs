STINGAR System - ORACLE Installation
===============

This page describes how to install software that STINGAR needs to run on a ORACLE (OL8.0) server.

#Install Docker & Python

Log onto the Oracle server as the STINGAR administrative user (has root privs); then install & launch the software required to setup & run STINGAR.

```
sudo yum update
#sudo yum install docker docker-compose gcc python3 pass -y

sudo yum install -y yum-utils 
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker.service
sudo systemctl enable containerd.service 

#sudo systemctl enable docker --now
sudo systemctl start dockerA
sudo chmod 666 /var/run/docker.sock
```

#Setup Docker Group
A system group named 'dockerroot' must include the STINGAR admin user (ie. the user you're currently logged in as). Create a group named 'dockerroot' and add the current user.
```
sudo groupadd dockerroot
sudo usermod -aG dockerroot ${USER}

sudo chmod 666 /var/run/docker.sock

```

Note: Use the actual string: ${USER}. This automatically converts to the name of the user who runs the command.

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

