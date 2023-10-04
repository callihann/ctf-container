docker build --ulimit nofile=2048 --network host -t ctf . 
docker run -it --rm -v %cd%/data:/data ctf /bin/bash
