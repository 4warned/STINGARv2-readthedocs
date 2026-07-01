<h1>Minimum Requirements</h1>

<h3>Confirm container runtime</h3>

<p style="margin:1em 0;">
After running <code>scripts/install_prerequisites.sh</code>, verify the runtime for your OS. The quickstart writes <code>.stingar-runtime</code> in your install directory.
</p>

<h4>Docker (Ubuntu / Debian)</h4>

```
docker ps
docker compose version
```

Expected: Docker lists containers (possibly empty); Compose V2 reports a version.

<h4>Podman (RHEL / Rocky / AlmaLinux)</h4>

```
podman ps
podman compose version
```

Expected: Podman responds without errors; `podman compose version` reports Compose V2.

<div style="border:solid 1px;padding:2em;border-radius: 3px;margin:1em;">

  <p>If Docker shows permission denied on <code>/var/run/docker.sock</code>:</p>

  <p>Ensure your user is in the <code>docker</code> group and log out/in, or on RHEL use the Podman install path instead.</p>

</div>

<h3>Python</h3>

```
python3 --version
```

STINGAR quickstart requires Python 3 for <code>configure_stingar.py</code>.

If all checks pass, proceed to [Run Installation Script](../install/run_quickstart.md).

See [Container Runtime](container_runtime.md) for the full Docker vs Podman matrix.

<button style="margin-top:3em;float:right;">[Proceed to Install STINGAR](../install/run_quickstart.md)</button>
