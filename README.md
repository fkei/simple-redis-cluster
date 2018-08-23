# simple-redis-cluster

Redis Cluster version of single container image

## Included products

- Redis [https://redis.io/](https://redis.io/)
  - [x] 4.0.10
- supervisor [http://supervisord.org/](http://supervisord.org/)

## Pre

Docker needs to be running.

## QuickStart

Pull image from docker.io [https://hub.docker.com/r/fkei/simple-redis-cluster/](https://hub.docker.com/r/fkei/simple-redis-cluster/)

```
make pull
```

docker run

```
make run
```

## Redis CLI Access


```
make cli
```
> Redis access port `:7000` `:7001` `:7002` `:7003`

## docker build (developer)

local build

```
make build
```

bash

```
make bash
```

## Help

```
make help
```