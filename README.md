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
