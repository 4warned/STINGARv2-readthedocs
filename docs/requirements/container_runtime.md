Container Runtime: Docker and Podman (Admin Server)
=========

STINGAR v2.4 selects the container runtime on your **admin server** based on operating system, matching honeypot host behavior documented in the [User Guide](https://stingarv2-user.readthedocs.io/en/latest/container_runtime.html).

| Host OS family | Example distributions | Runtime | Launch command |
|----------------|----------------------|---------|----------------|
| Debian | Ubuntu, Debian | Docker | `docker compose up -d` |
| RedHat | RHEL 8/9, Rocky, AlmaLinux, Oracle Linux | Podman | `podman compose up -d` |

The quickstart repository automates installation via `scripts/install_prerequisites.sh` and provides `scripts/compose.sh` to run the correct command on either platform.

## RHEL 8 and RHEL 9 compatibility (tested)

STINGAR validated compose tooling on Rocky Linux 8.9 and 9.3 (RHEL-equivalent):

| Approach | RHEL 8 | RHEL 9 |
|----------|--------|--------|
| pip `podman-compose` in default Python venv | **Fails** (Python 3.6; SyntaxError) | Works |
| pip `podman-compose` in Python 3.9 venv | Works | Works (py3.9 default) |
| EPEL `podman-compose` RPM | Works (v1.0.6) | Works (v1.5.0) |
| Native **`podman compose`** + Compose V2 plugin | **Works** | **Works** |

**Admin server quickstart** uses native **`podman compose`** with the Compose V2 plugin (`v2.40.3`) on all RedHat-family versions. This matches **`docker compose`** on Ubuntu and avoids the RHEL 8 Python 3.6 limitation.

**Honeypot hosts** deployed from the STINGAR UI still use the Python `podman-compose` package in `/opt/podman-compose-venv`. On RHEL 8, Langstroth installs that venv with **Python 3.9**.

## Install

After cloning the quickstart repository:

```sh
sudo ./scripts/install_prerequisites.sh
python3 configure_stingar.py
./scripts/compose.sh up -d
```

## Override

Set `CONTAINER_RUNTIME=docker` or `CONTAINER_RUNTIME=podman` before running the install script or `configure_stingar.py`.

## Podman specifics

* **Rootful Podman** — the install script runs with sudo; STINGAR binds ports 80 and 443 like Docker.
* **SELinux** — generated `docker-compose.yml` uses `:Z` volume labels on bind mounts.
* **Honeypot deployment** — `stingarapi` mounts the host container socket (`/var/run/docker.sock`) for Langstroth; on Podman hosts this is provided by `podman-docker`.
* **Auto-update** — in-app updates are disabled on Podman (`UPDATE_SERVICE_ENABLED=false`). Upgrade with `./scripts/compose.sh pull` and `./scripts/compose.sh up -d`.

## Honeypot hosts

Remote honeypot VMs use the same OS-based runtime selection during deployment from the STINGAR UI. See the User Guide [Container Runtime](https://stingarv2-user.readthedocs.io/en/latest/container_runtime.html) page for honeypot-side commands.
