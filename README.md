# Docker Bukkit
## A Bukkit/Spigot server on docker
Compiles and runs Spigot, a moddable Minecraft server. For Bukkit, see [my other project](https://hub.docker.com/r/bbriggs/bukkit/)

Tags follow version numbers, or you can track the latest version by using `latest`.
Tags: 
* `latest` ([latest/Dockerfile](https://github.com/bbriggs/docker-bukkit/blob/latest/Dockerfile))
* `1.8.3`  ([1.8.3/Dockerfile](https://github.com/bbriggs/docker-spigot/blob/1.8.3/Dockerfile))

### Running the server
To make your server and map data persistent, I recommend mounting a directory into the container. All server data in the container is written to `/data`. When running the server for the first time, you need to accept the EULA. To do so unattended, you can pass the environment variable `EULA=true` when running the container. 

Example: 
`docker run -it -v /data:/data -p 25565:25565  -e EULA=true --name mc_server bbriggs/spigot` 
