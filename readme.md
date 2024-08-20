

### О репозитории 
Для сборки контейнеров с naxsi + nginx

### connect to docker:  
docker exec -it [hash контейнера] bash


### Редачим правила
1. редачим nano /etc/nginx/naxsi_core.rules
2. вносим изменения в naxsi_core.rules в git 

### Можно использовать docker-compose.yml
#### Для этого создать подсеть
docker network create --subnet=172.31.100.0/24 waf_network
#### Потом поднять контейнеры
docker-compose up -d       
