# Docker Webserver

### How to use:
```
docker run -it alexbursak/webserver:amd
or
docker run -it alexbursak/webserver:arm
```
To build:
```
./build.sh [ArchType]
```
To push:
```
./push.sh [TagName]
```
Available architecture types:  
* ```amd (amd64|x86_64)```  
* ```arm (arm32v7)```  
