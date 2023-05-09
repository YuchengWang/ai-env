# ai-env

Dockerfile for AI environment on linux machine.

#　Build docker image

Build ubuntu20.04-py38 for example.

## Prepare

Create a directory to map docker home file like `/home/ycwang/work/tensorflow-gpu/ycwang`

Mapping directory:  `/home/ycwang/work/tensorflow-gpu/` -->  `/home`
Mapping user: `ycwang --> ycwang` Make sure docker user is the current host user

## Build 

Docker image name: self-tensorflow-gpu

Change user name from Dockerfile if needed

```
cd tensorflow/ubuntu20.04-py38
docker build -t  self-tensorflow-gpu .
```

## Use docker image

Use docker from host

```
docker run -it --rm --gpus all --ipc host \
    -v /home/ycwang/work/tensorflow-gpu:/home \
    self-tensorflow-gpu:latest
```
