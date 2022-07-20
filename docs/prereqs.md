<h1>Minimum Requirements</h1>

<h3>Hardware</h3>

STINGAR requires at least two servers: one hosts the STINGAR application, and one or more host the honeypots.


<h5>1. Server to Deploy/Manage Honeypots</h5>
One server hosts the STINGAR application which coordinates all STINGAR client activity & serves as your local system console. This server must have at least:

* 2 CPUs, 2 GB RAM, 20 GB Disk
* Linux or MacOS operating system (ubuntu is recommended)
* internet connectivity

STINGAR is installed on this 'admin server'; the installation process will prompt you for the domain name/ip address.

<h5>2. Server to Host Honeypot(s)</h5>
One or more servers must be available to host your honeypots. You may deploy honeypots to any number of servers. Each one should have at least:

* 1 CPU, 512 MB RAM, 8 GB Disk
* internet connectivity
* an alternate ssh port (for Cowrie deployments)


<h3>STINGAR Administrator</h3>
You need a user account with root access on each STINGAR server. The name can be any valid linux/MacOS username. You must be logged in as this user when you install STINGAR.

The person who installs STINGAR must have basic understanding of Docker and system administration. For comprehensive information about Docker, you may refer to [Docker](https://docs.docker.com/get-started/) & [docker-compose](https://docs.docker.com/compose/) documentation.

