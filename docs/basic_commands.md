Basic Container Commands
===============

Use `./scripts/compose.sh` from your quickstart directory — it runs **`docker compose`** on Ubuntu/Debian or **`podman compose`** on RHEL-family hosts.

See [Container Runtime](requirements/container_runtime.md) for the full matrix.

#### Start STINGAR
```
./scripts/compose.sh up -d
```

#### Verify STINGAR Containers Are Running
```
./scripts/compose.sh ps
```

#### Stop STINGAR
```
./scripts/compose.sh stop
```

#### Monitor STINGAR Logs
```
./scripts/compose.sh logs -f
```

#### Simulate Honeypot Events (for Testing)
```
ssh localhost -p 22
ssh localhost -p 23
```
