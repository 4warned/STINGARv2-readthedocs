Upgrading STINGAR v2 Platform
=============================

## STINGARv2 Updates

Forewarned provides updates as minor release versions (e.g. 2.3, 2.4, ...). See the [User Guide upgrading page](https://stingarv2-user.readthedocs.io/en/latest/upgrading.html) for in-app automated updates on Docker admin servers.

### Podman admin servers (RHEL)

In-app auto-update is not available on Podman installs in v2.4. From your quickstart directory:

```
./scripts/compose.sh pull
./scripts/compose.sh up -d
```

### Manual upgrade (all platforms)

<br>1) Backup your STINGAR honeypot data
<br>2) Stop your currently running STINGAR system
<br>```./scripts/compose.sh down```
<br>3) Backup your current STINGAR files
<br>```cp docker-compose.yml docker-compose_ORIG.yml```
<br>```cp stingar.env stingar_ORIG.env```
<br>4) Optionally remove cached images so new images are downloaded
<br>```docker image prune -a``` or ```podman image prune -a```
<br>5) Replace or update image tags in `docker-compose.yml` for the target release
<br>6) Start the new version
<br>```./scripts/compose.sh up -d```

See [docker-compose.yml reference](dockercompose.md) for the latest example.
