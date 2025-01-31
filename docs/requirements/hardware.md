<h1>Minimum Requirements</h1>

<h3>Hardware</h3>

STINGAR requires at least two compute machines (i.e. virtual machines or physical servers): one hosts the STINGAR application, and one or more host the honeypots.

<h5>1. Server to Deploy/Manage Honeypots</h5>
The main STINGAR application which coordinates all STINGAR honeypot activity & serves as your local system console. This server must have at least:

* 2 CPUs, 2 GB RAM, 20 GB Disk
* Linux or MacOS operating system (ubuntu is recommended)
* internet connectivity
* Network Port #24224 inbound open on server for communication from Honeypots 

STINGAR application is installed on this 'admin server'; the installation process will prompt you for the domain name/ip address.

<h5>2. Server to Host Honeypot(s)</h5>
One or more compute machines (virtual machine (VM) or physical servers, embedded devices (Raspberry Pi's, etc) running a 64bit x86 or ARM CPU architecture) must be available to host your honeypots. You may deploy honeypots to any number of machines. Each one should have at least:

* 1 CPU, 512 MB RAM, 8 GB Disk
* internet connectivity


<h3>STINGAR Administrator</h3>
You need a user account with root access on each STINGAR server. The name can be any valid linux/MacOS username. You must be logged in as this user when you install STINGAR.

The person who installs STINGAR must have basic understanding of Docker and system administration. For comprehensive information about Docker, you may refer to [Docker](https://docs.docker.com/get-started/) & [docker-compose](https://docs.docker.com/compose/) documentation.

