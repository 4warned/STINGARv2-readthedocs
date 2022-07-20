Attack Analysis
===============

Honeypot attack information is stored in an elasticsearch repository on your local server. To access the data, you will need to provide the API_KEY that was created for your STINGAR instance when you ran the QuickStart script. This key can be found in the stingar.env file in the STINGAR root directory.
You may access and analyze data in the elasticsearch repository a number of ways:

<h4>Elasticsearch Direct Access</h4>

You may query the elasticsearch repository directly using 'curl' or by entering the query command into a browser. You need to specify your STINGAR server name and provide your API key on the command line. An example elasticsearch query:

<div style="border:solid #e1e4e5 1px;background-color:#f8f8f8;padding:1em 1.2em;border-radius:3px;font-size:12px;font-family:monospace;color:#333;overflow:auto;white-space: nowrap;">
  curl -XGET '<span style="color:blue;">{your STINGAR hostname}</span>:9200/stingar\-\*/\_search?pretty' -H 'api-key: {your key}'
</div>

