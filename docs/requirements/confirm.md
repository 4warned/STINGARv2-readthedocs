<h1>Minimum Requirements</h1>

<h3>Confirm Docker Installation</h3>

<p style="margin:1em 0;">
Enter the following commands to confirm that Docker & docker-compose are installed. You should get the expected result:
</p>
```
docker ps
```

![Docker Installed Correctly](../img/docker_installed.png)

<div style="border:solid 1px;padding:2em;border-radius: 3px;margin:1em;">

  <p>If instead you see something like:</p>

  <div style="border:solid 1px;padding:1em;border-radius:3px;margin:1em;background-color:#F5F5F5">
    <i>/usr/bin/docker-current: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.26/containers/create: dial unix /var/run/docker.sock: connect: permission denied.</i>
  </div>

  <p>Then run the command:  <span style="color:blue">sudo chmod 666 /var/run/docker.sock</span></p>

</div>

<h3>Confirm Docker & Docker-Compose Versions</h3>

```
docker --version
```
Expected result: <span style="color:#000080;padding-left:2em;">Docker version 19.03.6 (or higher)</span>

```
docker-compose --version
```
Expected result: <span style="color:#000080;padding-left:2em;">docker-compose version 1.17.1 (or higher)</span>

If you see the expected results for these commands, you're ready to proceed to install STINGAR.
