# nginx-filehost
dockerfile and directory for nginx-based http fileserver.  uses docker official nginx container

### Usage
uses docker container to provide http filserver functionality within environment

1. clone repo
2. move desired content into `www/` folder
3. build new docker container using Dockerfile
4. run new container, exposing proper ports for web access

### Example Usage

    cd nginx-filehost
    mv -r ~/html/some-content ~/nginx-filehost/www/
    docker built -t nginx-filehost .
    docker run --name nginx-host1 -d -p 8080:80 nginx-filehost

### Caveats
* to list new content, new container will need to be built.  alternatively -- you can mount docker host volumes as folders within the nginx docker container.  this content will be dynamically updated on the container as files move in and out of folder

`docker run --name nginx-host2 -v ~/html/some-content:/usr/share/nginx/html:ro -d -p 8080:80 nginx-filehost`

### Use with `docker-machine`

because docker-machine runs within virtualbox using a 'nat' adapter for external access on the docker-machine host, a port-forward will need to be set-up inside of the docker-machine vm in virtualbox.  open settings > network for the docker-machine in virtualbox, click the 'advanced' arrow and click port forwarding button.  the following settings will be sufficient

| name | protocol | host ip | host port | guest ip | guest port |
| ---- | -------- | ------- | --------- | -------- | ---------- |
| nginx-8080 | tcp | (blank) | 8080 | (blank) | 8080 |

the blank settings make the host and guest ip addresses as wildcards.  you can optionally add settings to restrict the access to the forward, but will need to be updated if the docker-machine ip address changes.
