<h1>Configuration Files</h1>

The STINGAR QuickStart script prompts for some configurable values and uses this information to creates 3 files that STINGAR depends upon. The three files are:

* <span style="text-decoration:underline;">stingar.env</span> - Defines all environment variables used by all STINGAR components. This file contains values that define the API Key, port numbers, server names, passwords, the color scheme, etc.
* <span style="text-decoration:underline;">docker-compose.yml</span> - Defines the STINGAR Docker containers and configures these services. This file coordinates the services in an isolated environment.

* <span style="text-decoration:underline;">nginx.conf</span> - Nginx is a web service that controls access to STINGAR features by proxying URL requests to the appropriate service.

The content of these files shouldn't be altered unless you understand the impact of the change. One small change can cause STINGAR to fail and it might be difficult to debug. Therefore, we discourage changing values in these files with the following 2 exceptions:

<h4>1. Customize the STINGAR UI Appearance</h4>

You may customize the appearance of your STINGAR UI by changing the color theme (dark & light values) and the default number of rows that appear in the list of honeypot events. (These are defined at the bottom of the stingar.env file):

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| THEME_DARK_BASE_COLOR | 363636 | You may customize your STINGAR UI appearance by specifying the dark color.|
| THEME_LIGHT_BASE_COLOR | white | You may customize your STINGAR UI appearance by specifying the light color.|
| DEFAULT_ROWS_PER_PAGE | 1000 | Defines the default number of rows that will appear on the attach analysis page.|
| INSTITUTION_NAME | XYZ University | The name of your organization.  This will appear in the heading on each page of the UI. |

<h4>2. Implement LDAP Authentication</h4>

If your organization uses LDAP, you may configure STINGAR to authenticate users via your LDAP instance. To use LDAP, set LDAP_ENABLED to true and use the other LDAP variables to provide STINGAR with the info required to access it (host, port, base).  Once enabled, an [LDAP Login] button will appear on the STINGAR login page. Users may then choose to login with the username/password they use to access other systems within your organization.

STINGAR users still need a user record in STINGAR; then the person can use their organization login/password to access STINGAR. |


| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| LDAP_ENABLED | false | Set to true to enable LDAP authentication; then provide connection info in the LDAP host/port/base variables. |
| LDAP_HOST |  | The hostname of your organization's LDAP instance. |
| LDAP_PORT | integer | The port number to access your organization's LDAP instance.|
| LDAP_BASE |  |

You will need to stop and restart STINGAR to see the results of changes to these values.

<h2>stingar.env - Lists Environment Variables</h2>

This file is divided into the following sections.

<h5>Fluentd ENV variables</h5>

[Fluentd](https://www.fluentd.org/architecture) is a data collector that transfers attack event information to your elasticsearch repository and optionally the STINGAR CIF where it is aggregated with data from other organizations and made available to the STINGAR community. Fluentd needs to be configured to let STINGAR know where to pickup & deliver honeypot event transactions.

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| FLUENTD_HOST | fluentd  | The name of the host upon which the honeypots reside. |
| FLUENTD_PORT | 24224  |  The port number used to access honeypots. |
| FLUENTD_REMOTE_HOST | localhost | |
| FLUENTD_LOCAL_PORT | 24225 | |
| FLUENTD_KEY | random-string | Secret key provided with each transaction to prove a request is authorized |
| FLUENTD_APP | stingar |

<h5>Fluent Bit ENV variables</h5>
| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| FLUENTBIT_HOST | fluentbit  |  |
| FLUENTBIT_PORT | 24284  | Content Cell |
| FLUENTBIT_APP | stingar | |
| FLUENTD_HOSTNAME | flb.local | |

<h5>Syslog ENV variables</h5>

[Syslog](https://en.wikipedia.org/wiki/Syslog) is an optional logging service provided by Stingar to allow logging of honeypot indicator data to a remote Syslog server. 

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| SYSLOG_ENABLED | false | Set to true to enable Syslog service |
| SYSLOG_HOST |   | The hostname of your organization's Syslog server |
| SYSLOG_PORT | 514 | Default Port number for Syslog |
| SYSLOG_SEVERITY | info | Default severity tag for all Syslog messages |
| SYSLOG_HOSTNAME | localhost | Default name of Stingar server hostname | 
| SYSLOG_PROTOCOL | udp | Default protocol used to pass Syslog messages ['tcp' also supported] |

<h5>Local File logging settings</h5>

Stingar can be configured to export all honeypot indicator data to a local file stored on the local server. The default file location is defined in the Docker-compose.yml file under the FluentD volume definition as <code>- ./stingar-logs:/var/log/stingar</code>. Note, this service is disabled by default. To enable, edit the <code>stingar.env</code> file and change the FILE_ENABLED value to 'true'. Also, ensure the local log directory <code> ./stingar-logs </code> has write permissions set <code> % chmod 777 ./stingar-logs </code> 

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| FILE_ENABLED | false | Set to true to enable local file logging service |


<h5>CIF ENV variables</h5>
| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| CIF_ENABLED | false | Set to true if honeypot events are to be sent to the common STINGAR CIF. |
| CIF_HOST | | Name of the server that hosts the common STINGAR CIF. |
| CIF_TOKEN |  Key that you must use to communicate with the STINGAR CIF. |
| CIF_PROVIDER | |
| CIF_DEFAULT | yellow ||
| CIF_CONFIDENCE | 9 ||
| CIF_TAGS | honeypots ||
| CIF_GROUP | everyone | |

<h5>Docker repository settings</h5>

This identifies the address where the latest STINGAR code can be retrieved.

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| DOCKER_REPOSITORY|stingarregistry.azurecr.io| The address of the repository from which you can download the STINGAR application. |
| DOCKER_USERNAME|{your STINGAR repo username}| Your STINGAR Registry username |
| DOCKER_PASSWORD|{your encrpted password}| Your STINGAR Registry password (encrypted) |

| Env Var Name | Value | Description |
| ------------ | ------------- | ------------ |
| API_HOST | http://stingarapi:8000/ |The address used by STINGAR to call the API |
| API_KEY | {string of random chars} | Auto-generated by QuickStart to provide you with access to your STINGAR API |
| PASSPHRASE | {string of random chars} |  Auto-generated by QuickStart to provide you with access to your STINGAR API |
| SALT | {string of random chars} |  Auto-generated by QuickStart to provide you with access to your STINGAR API |
| STINGAR_SERVICE_URL | http://stingarapi:8000/api/v2 | The URL that provides access to the STINGAR API. |
| UI_HOSTNAME | stingar.domain.edu | The server name that hosts the STINGAR UI. |

