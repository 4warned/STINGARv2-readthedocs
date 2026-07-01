STINGAR System - RHEL/Centos Installation
===============

**RedHat-family hosts (RHEL, Rocky Linux, AlmaLinux, Oracle Linux, CentOS Stream)** should follow the dedicated Podman guide:

<button>[RHEL / Rocky / AlmaLinux installation (recommended)](setup_rhel.md)</button>

The section below describes a legacy Docker-on-RHEL path. Prefer [setup_rhel.md](setup_rhel.md) and the quickstart `install_prerequisites.sh` script for v2.4 installs.

# Legacy: Install Docker manually on RHEL

Log onto the server as the STINGAR administrative user; install Docker CE from [Docker's RHEL documentation](https://docs.docker.com/engine/install/rhel/), then:

```
sudo systemctl enable --now docker
sudo usermod -aG docker ${USER}
```

Log out and back in, then verify with [Verify Software Installation](confirm.md).

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
