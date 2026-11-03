STINGAR System - Ubuntu Installation
===============

This page describes how to install software that STINGAR needs on Ubuntu or Debian. Supported Ubuntu LTS releases: **22.04**, **24.04**, and **26.04**. Debian stable releases are also supported.

# Recommended: quickstart install script

After cloning the [STINGAR quickstart](https://github.com/4warned/stingar-quickstart) repository:

```sh
cd stingar
sudo ./scripts/install_prerequisites.sh
```

This installs Docker CE, the Compose V2 plugin (`docker compose`), and Python 3.

# Manual install (alternative)

```
sudo apt update
sudo apt upgrade -y
sudo apt install ca-certificates curl gnupg python3 -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl enable --now docker
```

# Docker group

Add the STINGAR admin user to the `docker` group:

```
sudo groupadd docker 2>/dev/null || true
sudo usermod -aG docker ${USER}
```

<div style="font-weight:bold">IMPORTANT: Log out and back in before continuing.</div>

Verify with [Verify Software Installation](confirm.md).

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
