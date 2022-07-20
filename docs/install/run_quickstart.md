Download & Install STINGAR Application
===============

### Before you start, enter information about your STINGAR server in the box below.

<b>STINGAR_HOSTNAME:  Do not include the https prefix.</b>

<div style="border: solid 1px;border-radius:3px;padding:2em;margin-bottom:2em;background-color:#fffff0;">
  {{{user-defined-values}}}
</div>

### Then follow the instructions below...

You need to be logged onto your STINGAR server: <b>STINGAR_HOSTNAME</b> as <b>STINGAR_ADMIN_USER</b>.

```
ssh STINGAR_ADMIN_USER@STINGAR_HOSTNAME
```

While logged onto this server as STINGAR_ADMIN_USER, follow the instructions below to step through the process to download STINGAR & run a script to install & configure it.

# Download QuickStart Script

The STINGAR QuickStart script is available in Duke's public gitlab repository. The script will prompt you for configuration specs and will then do all the work to download, install & configure your implementation of STINGAR. When done, you will be able to enter your STINGAR server hostname in a browser (<b>https://STINGAR_HOSTNAME</b>) to access your running implementation of STINGAR.  Run the following command to download the script:

<div style="border:solid #e1e4e5 1px;background-color:#f8f8f8;padding:1em 1.2em;border-radius:3px;font-size:12px;font-family:monospace;color:#333;overflow:auto;white-space: nowrap;">
  <div style="display:block;margin:.5em 0;">git clone https://gitlab.oit.duke.edu/stingar2-public/stingar-quickstart stingar</div>
  <div style="display:block;margin:.5em 0;">cd stingar</div>
</div>

The command above creates a directory named 'stingar' in the root directory of STINGAR_ADMIN_USER & pulls down all files needed to install STINGAR, saving them to this new 'stingar' directory.

# Install Basic SSL

To implement simple SSL certification for STINGAR, you may choose to create public/private keys for STINGAR using the following commands:
First, from within the stingar directory, create a 'certs' directory in which the keys will be stored.

<div style="border:solid #e1e4e5 1px;background-color:#f8f8f8;padding:1em 1.2em;border-radius:3px;font-size:12px;font-family:monospace;color:#333;overflow:auto;white-space: nowrap;">
  mkdir certs
</div>

<div style="margin:.8em 0;">Next create the keys using the following command.</div>

<div style="border:solid #e1e4e5 1px;background-color:#f8f8f8;padding:1em 1.2em;border-radius:3px;font-size:12px;font-family:monospace;color:#333;overflow:auto;white-space: nowrap;">
  openssl req -subj /CN=STINGAR_HOSTNAME -x509 -newkey rsa:4096 -nodes -keyout certs/key.pem -out certs/cert.pem -days 365
</div>

<br/>
Verify that the two expected files were created in the certs directory:
<div style="border:solid #e1e4e5 1px;background-color:#f8f8f8;padding:1em 1.2em;border-radius:3px;font-size:12px;font-family:monospace;color:#333;overflow:auto;white-space: nowrap;">
  ls certs
</div>

You should find these 2 files in that directory:

* cert.pem
* key.pem


# Run the QuickStart Script

At this point you should have docker, docker-compose & python3 installed on this server and the QuickStart script (file: configure_stingar.py) downloaded to the current directory.

You will need the password provided by the STINGAR team to retrieve STINGAR from the registry where the code resides. Contact the STINGAR team (<team-stingar@duke.edu>) if you don't have a STINGAR Registry account or do not know your username/password for it.

Now it's just a matter of running the script and responding to the prompts:

```
python3 configure_stingar.py
```
<style>
  .quickStartOutput {
    color: gray;
    font-style: italic;
  }
  .userInput {
    color: blue;
    font-style: underline;
    font-size: small;
    margin-left: 1em;
  }
</style>
A sample script session is shown below (Input values for a default configuration appear in <span style="color:blue;">blue</span>.)
<div style="border: solid 1px;border-radius 3px;background-color:#fffff0;padding:1em;">

  <div class="quickStartOutput">Checking if docker is installed...</div>
  <div class="quickStartOutput">Checking if docker-compose is installed...</div>

  <span class="quickStartOutput">
    Enter the URL where your STINGAR web app will be available. The domain must be resolvable. E.g.: sub.domain.tld or localhost/stingar.
    Domain: </span><span class="userInput">STINGAR_HOSTNAME</span>

  <span class="quickStartOutput">Please enter your SSL certificate path. [./certs]:</span><span class="userInput">[Return]</span>

  <span class="quickStartOutput">Do you wish to specify an alternate Docker registry? (y/n): [y]</span><span class="userInput">[Return]</span>

  <span class="quickStartOutput">Please enter the URL for the Docker registry: [stingarregistry.azurecr.io]</span><span class="userInput">[Return]</span>

  <span class="quickStartOutput">Please enter your Docker registry username:</span><span class="userInput">STINGAR_REGISTRY_USER</span>

  <span class="quickStartOutput">Please enter your Docker registry password:</span><span class="userInput">Enter the registry password that was provided to you by the STINGAR team</span> (Note: The password will not display.)

  <div class="quickStartOutput">Testing registry authentication...</div>
  <div class="quickStartOutput">WARNING! Using --password via the CLI is insecure. Use --password-stdin.</div>
  <div class="quickStartOutput">Login Succeeded</div>
  <div class="quickStartOutput" style="color:green;">Authentication to stingarregistry.azurecr.io succeeded.</div>

  <span class="quickStartOutput">Do you wish to enable logging to a remote CIFv3 server? (y/n): [n] </span><span class="userInput">[Return]</span>

  <div class="quickStartOutput"><b>If you don't know what a CIF server is, or don't have one available, answer n or hit enter.</b></div>

  <div class="quickStartOutput">If you have a CIF server you wish indicators (IP, hash, url) from your honeypots to be submitted to (such as the STINGAR project, answer y to this question.</div>

  <b>If you answer y to this last question, you will be presented with three follow-up questions:</b>

  <div class="quickStartOutput"><b>Configuring for Collective Intelligence Framework (CIF)</b></div>

  <div class="quickStartOutput">Please enter the URL for the remote CIFv3 server:</div>
  <div class="quickStartOutput">Please enter the API token for the remote CIFv3 server:</div>
  <div class="quickStartOutput"> This token must have write privileges to the remote CIF instance.</div>
  <div class="quickStartOutput">Please enter a name you wish to be associated with your organization: </div>

  <div class="quickStartOutput">For more information about CIFv3 and its configuration, please refer to our [CIF documentation](https://csirtgadgets.com/collective-intelligence-framework/).</div>
</div>

# QuickStart Script Results

Upon completion, the script should report that it has created three files:

- <span style="color:green;">stingar.env</span>
- <span style="color:green;">nginx.conf</span>
- <span style="color:green;">docker-compose.yml</span>

<h4></h4>
These files define the way your instance of STINGAR appears & functions. They may be modified to add or change the behavior and appearance of your implementation of STINGAR. More detailed information about these files is available [here](../config_files.md).
