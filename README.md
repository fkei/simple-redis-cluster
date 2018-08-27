# simple-redis-cluster

Redis Cluster version of single container image


## QuickStart

### docker

to docker container

```
# docker pull
docker pull fkei/simple-redis-cluster

# run
docker run --rm --name=$(__NAME) \
	 -p 7000:7000 \
	 -p 7001:7001 \
	 -p 7002:7002 \
	 -p 7003:7003 \
	 -p 7004:7004 \
	 -p 7005:7005 \
	 -v ./data:/docker \
	 -it \
	 fkei/simple-redis-cluster
```

### k8s(helm)

to helm

```
# Add helm repository.
helm repo add simple-redis-cluster https://fkei.github.io/simple-redis-cluster/

# Install
helm install simple-redis-cluster/simple-redis-cluster --name simple-redis-cluster
```


## Included products

- Redis [https://redis.io/](https://redis.io/)
  - [x] 4.0.10
- supervisor [http://supervisord.org/](http://supervisord.org/)


## Documentation (docker image)

- **[4.0.10](4.0.10)**

## Documentation (helm/k8s)

- **[helm/simple-redis-cluster](helm/simple-redis-cluster)**
