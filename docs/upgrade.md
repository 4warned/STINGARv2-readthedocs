Upgrading STINGAR v2 Platform
=============================

## STINGARv2 Updates

We provide updates to Version 2 of STINGAR as minor release versions (e.g. 2.1, 2.2, ...) to keep up to date with the latest OS builds and dependencies and fix any reported bugs or vulnerabilities.

### Update annoucements

The STINGAR slack channel is the primary communications tool for all such minor version annoucements, along with our [News Page](https://forewarned.io/blog/) on our website and direct email notifications to the primary technical contact person at licensed institutions.

### Updating steps

These updates will be released as new docker images in the registry. The docker image tag labels will be updated for all docker images in the platform for any given minor release and a new docker-compose.yml file will be supplied referencing the new release version images.

In order to update your STINGAR version you will need to complete the following steps:
<br>1) Backup your STINGAR honeypot data
<br>2) Stop your currently running STINGAR system
<br>```% docker-compose down```
<br>3) Backup your current STINGAR files
<br>```% cp docker-compose.yml docker-compose_ORIG.yml``` <br>```% cp stingar.env stingar_ORIG.env```
<br>4) Delete the existing docker images from the vm so they new images can be downloaded
<br>```% docker image prune -a```
!!! warning "Risk of loss of honeypot data"
    The ```docker image prune``` command will not delete any of your persisted Honeypot details. However, there are other docker commands that could, please take care not to delete the docker <b>volumes</b> from your vm or you will lose your honeypot information and admin account password.
<br>5) Replace the docker-compose.yml file with the latest version
<br>```% mv docker-compose-2.2.yml docker-compose.yml```
<br>6) Start the new version
<br>```% docker-compose up -d```

### docker-compose.yml

Here is example [docker-compose.yml](dockercompose.md) for our latest v2.2 release
