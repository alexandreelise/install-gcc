# INSTALL GCC LATEST ON ANY UBUNTU LTS SINCE UBUNTU 14.04 LTS
Optimized Dockerfile to install gcc on any Ubuntu LTS version since Ubuntu 14.04 LTS  latest available on each platform at the time of writing.

>**DISCLAIMER: PLEASE BE CAREFUL WHEN YOU TYPE THOSE INSTRUCTIONS REVIEW THEN THOUROUGHLLY. 
>I WILL NOT BE RESPONSIBLE OF ANY DAMAGE, DATA LOSS, LOSS OF TRUST, LOSS OF MONEY OF ANY KIND.
>DON'T JUST COPY PASTE ANYTHING ON THE INTERNET DIRECTLY ON YOUR PRODUCTION SERVERS WITHOUT CAREFUL REVIEW AND SECURITY TESTS.
>THIS CODE IS MEANT TO BE USE ON DEV ENVIRONMENT AND FOR TESTING PURPOSE. 
>IF YOU FEEL OK WITH EVERYTHING I JUST SAID BEFORE, FEEL FREE TO PROCEED.
>OTHERWISE, DO NOT USE IT** 


> My original script can be found on my old GitHub account (just for reference) prefer using this repo rather than the old one
> https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91#file-how-to-install-latest-gcc-on-ubuntu-lts-txt

## PRE-REQUISITE:
- You know want Docker is (If not : https://www.docker.com)
- You have latest version of Docker installed on your machine
- You have latest git version on your machine
- You understand how a Dockerfile works (If not : https://docs.docker.com/engine/reference/builder/)
- You are not scared of using the Terminal  or command-line tools
- Don't worry you'll be ok. Give it a try

## DOCKER IMAGES ON DOCKER HUB
> https://hub.docker.com/repository/docker/alexandreelise/install-gcc

## USAGE
To create an Docker image locally on your machine. Please follow those instructions (E.g. build image gcc 9 on Ubuntu 14.04 LTS)

```sh
git clone https://github.com/alexandreelise/install-gcc && \
cd install-gcc && \
docker image build --build-arg BASE_IMAGE=ubuntu:14.04 --build-arg WANTED_GCC_VERSION=9 -f Dockerfile -t 'yourusername/install-gcc:9-ubuntu-14.04' .

```

## EXTRA
If you prefer using the multi-build.sh script to build all the combinations of Ubuntu LTS versions and gcc versions at once you can tweak the provided script or use it as is


```sh

git clone https://github.com/alexandreelise/install-gcc && \
cd install-gcc && \
chmod 700 multi-build.sh && \
./multi-build.sh

```

## NOTE
Does not work anymore with Ubuntu 12.04 LTS (image not found)

## SPECIAL THANKS:
Special thanks to the Ubuntu community, Gcc community and Docker community.

## SHARING IS CARING
> If you find this repo useful to you consider give it a star, fork it share it with whom it might be useful too
> https://github.com/alexandreelise/install-gcc
