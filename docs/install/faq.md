# Alternative STINGAR Installation Methods

If your system requirements differ from our recommended approach (i.e. Ubuntu/CentOS/RHEL with docker / docker-compose) there are alternative technologies that will also allow you to install STINGAR but require some manual editing of the 3 configuration files created by the quickstart script: 
<code>stingar.env</code>
<code>nginx.conf</code>
<code>docker-compose.yml</code>
</br>This approach will allow you to install and run STINGAR web dashboard but will have some limitations on the automatic deployment of honeypots.

<h4>Podman / podman-compose</h4>

Podman is an alternative to Docker which doesn't require sudo access to your host. It does, however, limit the port mappings of your host to >1024. Hence you will need to point your browser at a specific port number (above 1024) to access the STINGAR web dashboard.  

In this wallkthrough example we will use port <b>8443</b> instead of the default <b>443</b>: (ensure your firewall settings allow inbound traffic from ports 8443, 8080, 24224.

<b>STEP 1)</b> You will need to edit your <code>nginx.conf</code> file to update the listen ports and port mapping settings :

change lines ~36/37 of <code>nginx.conf</code> to :
```sh
listen [::]:8443 ssl ipv6only=on; # managed by Certbot
listen 8443 ssl; # managed by Certbot
```
<FONT COLOR="RED">
and change line ~106 to:
</FONT>
```sh
proxy_set_header  X-Forwarded-Host $host:$server_port; # append ':$server_port' to '$host' 
```

<b>STEP 2)</b> edit the <code>docker-compose.yml</code> file to update the port mappings and file permissions of the <b>web</b> container

<font COLOR="RED">
change lines ~74/75 of <code>docker-compose.yml</code> to :
</font>
```sh
    82 	  web:
    83	    image: nginx
    84	    container_name: nginx
    85	    ports:
    86	      - 8080:80
    87	      - 8443:8443
    88	    volumes:
    89	      - ./certs:/etc/nginx/conf.d:z
    90	      - ./stingar-nginx/nginx.conf:/etc/nginx/nginx.conf:ro,Z
    91	    restart: on-failure
```

modify & re-save the file

<b>STEP 3)</b> edit the <code>stingar.env</code> file to update these <b>2</b> environment variables:

<font COLOR="RED">
change line ~44 of <code>stingar.env</code> to :
</font>
```sh
API_HOST=http://stingarapi.dns.podman:8000/
```
<font COLOR="RED">
and change line ~69 of <code>stingar.env</code> to :
</font>
```sh
STINGAR_SERVICE_URL=http://stingarapi.dns.podman:8000/api/v2
```
<font COLOR="RED">
<b>NOTE: ensure there are no trailing spaces on these two lines</b>
</font>

modify & re-save the file - 

<b>STEP 4)</b> then start the current enviroment
```sh
% podman-compose up -d
```
& then point your browser at the correct port <code>https://localhost:8443</code>


