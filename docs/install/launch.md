<h1>Launch STINGAR</h1>

With STINGAR downloaded and configured (logged in as the STINGAR user in the <code>stingar</code> directory):

```
./scripts/compose.sh up -d
```

This runs <code>docker compose up -d</code> on Docker hosts or <code>podman-compose up -d</code> on RHEL-family Podman hosts.

It can take up to 10 minutes to start the first time. Monitor progress:

```
./scripts/compose.sh logs -f stingarui
```

STINGAR is ready when the log output stops scrolling and you see Next.js ready messages.

<h4>Access STINGAR From a Browser</h4>

Enter <b>https://</b> followed by your STINGAR hostname. With self-signed certificates, accept the browser security warning via Advanced.

<h4>STINGAR Admin User</h4>

STINGAR provides an <b>'admin'</b> user for the web application (not the Linux login). Set the password on first login.

Congrats! You have successfully installed STINGAR.

Proceed to the <b>User Guide</b> from the STINGAR dashboard (bottom left menu) to deploy honeypots and connect to the shared threat feed.

<button style="margin-top:3em;float:right;">[Container runtime reference](../requirements/container_runtime.md)</button>
