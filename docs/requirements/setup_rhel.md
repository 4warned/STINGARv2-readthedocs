STINGAR System - RHEL / Rocky / AlmaLinux Installation
===============

RedHat-family hosts use **Podman** as the container runtime. The quickstart installs Podman, the Docker-compatibility shim (`podman-docker`), and the **Compose V2 plugin** for native **`podman compose`** (validated on Rocky Linux 8.9 and 9.3).

# Install prerequisites

Log onto the server as the STINGAR administrative user (with sudo). Clone the [STINGAR quickstart](https://github.com/4warned/stingar-quickstart) repository, then run:

```sh
cd stingar
sudo ./scripts/install_prerequisites.sh
```

This installs:

* `podman` and `podman-docker`
* Docker Compose V2 plugin at `/usr/local/lib/docker/cli-plugins/docker-compose` (invoked as **`podman compose`**)
* Enables `podman.socket` for Docker API compatibility (on systemd hosts)

The install script uses **`curl-minimal`** when present (UBI 9 and other minimal images ship this instead of the full `curl` package).

The script writes `.stingar-runtime` in the quickstart directory.

<div style="font-weight:bold">IMPORTANT: Log out and back in after installation if you also use Docker group membership on hybrid hosts.</div>

# Verify Podman and Compose

```sh
podman --version
podman compose version
podman ps
```

Expected: Podman responds without errors; `podman compose version` reports Docker Compose v2.x; `podman ps` shows an empty list or running containers.

Do **not** rely on `pip install podman-compose` with system Python 3.6 on RHEL 8 — current releases require Python 3.8+. The quickstart uses native **`podman compose`** instead.

# Firewall and SELinux

* Open ports **80**, **443**, and **24224** (TCP/UDP) in `firewalld` if enabled.
* STINGAR quickstart generates compose files with SELinux volume labels (`:Z`) appropriate for Podman.

# Auto-update limitation

In-app automated updates are **not supported** on Podman admin installs in v2.4. The quickstart sets `UPDATE_SERVICE_ENABLED=false` in `stingar.env`. Upgrade manually:

```sh
./scripts/compose.sh pull
./scripts/compose.sh up -d
```

See the [User Guide upgrading page](https://stingarv2-user.readthedocs.io/en/latest/upgrading.html) for details.

# Docker on RHEL instead of Podman

To force Docker on a RedHat host (not recommended for production RHEL):

```sh
CONTAINER_RUNTIME=docker sudo ./scripts/install_prerequisites.sh
```

You must install Docker CE yourself; the prerequisite script only automates Docker on Debian/Ubuntu.

For legacy manual Podman workarounds (rootless, high ports), see [Alternative Installation Methods](../install/faq.md).

<button style="margin-top:3em;float:right;">[Proceed to Next Step](confirm.md)</button>
