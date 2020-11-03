# Docker Swarm Kit

Setup the docker swarm cluster with some infrastructure services like:
- traefik
- swarmpit
- portainer
- grafana
- alertmanager
- unsee
- prometheus

## Prerequisites
- Linux server with docker daemon installed
- Configure the custom dns for docker daemon (Optional)

```
vi /etc/docker/daemon.json

{
    ......
    "dns": ["192.168.3.1", "8.8.8.8", "1.1.1.1"]
}

systemctl daemon-reload
systemctl restart docker
```

## Setup Docker Swarm Cluster

### Setup swarm mode
```
docker swarm init --advertise-addr 192.168.153.144
```
### Add as manager node (Optional)
```
docker swarm join --token SWMTKN-1-0hojoav4092f23u8j7zpxcw6crla1a40otxchbf9lvgek3uy0l-e13r5ghg264z25h61j4r94tk0 192.168.153.144:2377
```
### Add as worker node (optional)
```
docker swarm join --token SWMTKN-1-0hojoav4092f23u8j7zpxcw6crla1a40otxchbf9lvgek3uy0l-bdtdl9sdwk6f56aqalafl4gzd 192.168.153.144:2377
```

You can get these token by using command `docker swarm join-token manager` for the manager node and `docker swarm join-token worker` for the woker node.

## Setup Infrastructure Services
### Setup traefik proxy
```
sh 1.setup_traefik.sh
```

Service URL:
- https://traefik.dev.local

### Setup monitor stack
```
sh 2.mon_stack.sh
```

Service URL:
- https://grafana.dev.local
- https://alertmanager.dev.local
- https://unsee.dev.local
- https://prometheus.dev.local

### Setup Swarmpit Dashboard
```
sh 3.swarmpit.sh
```

Service URL:
- https://swarmpit.dev.local

### Setup Portainer managerment UI
```
sh 4.portainer.sh
```

Service URL:
- https://portainer.dev.local


To addess the services url, you need configure the DNS server or, add following to `/etc/hosts`

```
192.168.153.144 dev.local
192.168.153.144 grafana.dev.local
192.168.153.144 alertmanager.dev.local
192.168.153.144 unsee.dev.local
192.168.153.144 prometheus.dev.local
192.168.153.144 traefik.dev.local
192.168.153.144 swarmpit.dev.local
192.168.153.144 portainer.dev.local
```
