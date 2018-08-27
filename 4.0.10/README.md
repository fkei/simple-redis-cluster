# Setup

Redis Cluster 4.0.10

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

- Redis access port
  - `:7000` `:7001` `:7002` `:7003` `:7004` `:7005`
- Redis announce ip
  - `127.0.0.1`
- Redis announce ports 
  - `:17000` `:17001` `:17002` `:17003` `:17004` `:17005`


## Persistence

Volume mount -> `./data`

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
