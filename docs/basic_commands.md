Basic Docker & Docker Compose Commands
===============

Please refer to Docker documentation for comprehensive information about [Docker](https://docs.docker.com/get-started/) & [docker-compose.](https://docs.docker.com/compose/).

####Start STINGAR
```
docker-compose up -d
```


####Verify STINGAR Containers Are Up & Running
```
docker-compose ps
```


####Stop STINGAR
```
docker-compose stop
```


####Monitor STINGAR Logs
```
docker-compose logs -f
```


####Simulate Honeypot Events (for Testing)
```
ssh localhost -p 22
ssh localhost -p 23
```
