# Docker-compose.yml

The <code><b>docker-compose.yml</b></code> contains the docker container configuration details for the STINGARv2 system.

This is the <code>docker-compose.yml</code> file for the STINGARv2 system. The images use the <code>:latest</code> tag; pin a specific release (e.g. <code>:v2.4.5</code>) if you need a fixed version :

```
services:
  docs:
    image: 4warned/stingar-user-docs:latest
  elasticsearch:
    user: "1000"
    image: 4warned/elasticsearch:latest
    healthcheck:
      test: [ "CMD-SHELL", "curl -s http://localhost:9200/_cluster/health?wait_for_status=yellow || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 10
    volumes:
      - elastic_data:/usr/share/elasticsearch/data:z
      #- ./elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
      #- ./backup:/usr/share/elasticsearch/backup
    ports:
      - "127.0.0.1:9200:9200"
      - "127.0.0.1:9300:9300"
    environment:
      discovery.type: "single-node"
      ES_JAVA_OPTS: "-Xmx1G -Xms1G" # modify this runtime memory allocation setting as appropriate (e.g. "-Xmx1G -Xms1G")
      logger.level: WARN
      bootstrap.memory_lock: "true"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    restart: unless-stopped
  
  kibana:
    user: "1000"
    image: 4warned/kibana:latest
    ports:
      - "127.0.0.1:5601:5601"
    depends_on:
      elasticsearch:
        condition: service_healthy

  redis:
    image: redis:7.0.4

  fluentd:
    image: 4warned/fluentd:latest
    ports:
      - "24224:24224"
      - "24224:24224/udp"
      - "127.0.0.1:24225:24225"
      - "127.0.0.1:24225:24225/udp"
    env_file:
      - stingar.env
    depends_on:
      elasticsearch:
        condition: service_healthy
    #volumes:
      #- ./stingar-logs:/var/log/stingar
      #- ./fluent.conf:/fluentd/etc/fluent.conf
      
  stingarapi:
    image: 4warned/stingar-api:latest
    env_file:
      - stingar.env
    volumes:
      - ./storage/db:/srv/db:z
      - ./stingar.env:/app/stingar.env:rw
      - ./docker-compose.yml:/app/docker-compose.yml:rw # mount docker-compose.yml to allow auto updates of images.
      - honeypot_templates:/opt/templates # new local volume for storing hp template files from HP Store
    depends_on:
      elasticsearch:
        condition: service_healthy

  stingarui:
    image: 4warned/stingar-ui:latest
    env_file:
      - ./stingar.env
    environment:
      - API_HOST=http://stingarapi:8000
    volumes:
      - bundle:/bundle
      - node_module_cache:/stingar-ui/node_modules
    depends_on:
      - stingarapi

  web:
    image: nginx:latest
    container_name: nginx
    ports:
      - 80:80
      - 443:443
    volumes:
      - ./certs:/etc/nginx/conf.d:z
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - credentials:/credentials
    restart: on-failure

  langstroth:
    image: 4warned/langstroth:latest
    env_file:
      - stingar.env
    depends_on:
      - stingarapi

volumes:
  bundle:
  node_module_cache:
  credentials:
  elastic_data:
  honeypot_templates: 
```
