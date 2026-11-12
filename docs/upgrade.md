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

### Update the nginx.conf security settings (v2.4.5 and later)

If your deployment bind-mounts its own `nginx.conf` (the `web` service mounts a
local `nginx.conf` into the stock nginx image), that file is not updated when
you pull new images. Refresh it when upgrading to v2.4.5 or later so the edge
applies the current TLS and HTTP security-header hardening.

In the `http` block, enable TLS 1.3 alongside TLS 1.2:

```
ssl_protocols TLSv1.2 TLSv1.3;
```

In the `server` block that terminates TLS (after the `ssl_certificate` lines),
add the security response headers so they apply to every location:

```
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
add_header X-Content-Type-Options "nosniff" always;
add_header X-Frame-Options "SAMEORIGIN" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;
```

The `always` flag ensures the headers are sent on error responses too. After
editing the mounted file, reload nginx without a full restart:

```
docker compose exec web nginx -s reload
```

Quickstart installs already ship this hardened `nginx.conf.template`; only
deployments using a customized `nginx.conf` need this manual step.

See [docker-compose.yml reference](dockercompose.md) for the latest example.
