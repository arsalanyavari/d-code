# d-code
This repo is just for fun, but if one day you need the VS code inside the container, you can use it.

I will also write the steps to set it up so that you can have it on your containers... for easier use and testing, you can also use the included Docker file :)

Now the image is availabe on dockerhub in arsalanyavari/d-code repo


### initiation this project
#### method 0:
After clonning the repository, install Docker, docker-compose and GNUmake
You can use two these commands: ```make``` ```make clean``` 

If you want configure step by step folliw below steps:
1. Run ```make inti```
2. Run ```docker-compose up --build -d 1> /dev/null```
3. Run ```docker exec -it DockerVScode code --no-sandbox --user-data-dir=/home```
4. Also using ```docker-compose down for downing the service```


#### method 1:
1. Clone repository
2. Store the output of `xauth list` command on your host machine
3. Run docker-compose up -d
4. `docker exec -it DockerVScode bash` then pass the output of [step2] as an input for `xauth add` command on a container
5. Run code on container and enjoy =)

#### method 2:
1. At the first clone the repository
2. Then build the image using Dockerfile with `docker build` command
3. Store the output of `xauth list` command on your host machine
4. Run a container based on image and pass the output of the previous step as an input for `xauth add` command on a container
5. Run code and work with it :)


### having VS code on any container
1. First of all you need install docker 
2. Then store the output of `xauth list` command on your host machine
3. Start container with `--net=host` and `-e DISPLAY` options
4. Then Install two `xauth` and `code` packages on a container
5. Now pass the output of [step2] as an input for `xauth add` command on a container
6. start code and be enjoy :D
