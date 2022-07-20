STINGAR System - RHEL/Centos Installation
===============

This page describes how to install software that STINGAR needs to run on a RHEL/Centos server.

#Install Docker & Python

Log onto the Centos server as the STINGAR administrative user (has root privs); then install & launch the software required to setup & run STINGAR.

```
sudo yum update
sudo yum install docker docker-compose gcc python3 pass -y
sudo systemctl enable docker --now
sudo systemctl start docker
```

#Setup Docker Group
A system group named 'dockerroot' must include the STINGAR admin user (ie. the user you're currently logged in as). Create a group named 'dockerroot' and add the current user.
```
sudo groupadd dockerroot
sudo usermod -aG dockerroot ${USER}
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

