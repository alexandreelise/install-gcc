ARG BASE_IMAGE

FROM "$BASE_IMAGE"

MAINTAINER Mr Alexandre J-S William ELISÉ <code@apiadept.com>

LABEL "com.apiadept"="Api Adept"
LABEL version="v0.1.0"
LABEL description="This Dockerfile allows to install gcc version you choose in ARG \
on the BASE_IMAGE you choose in ARG. It has been tested on Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS and Ubuntu 18.04 LTS with gcc 9. \
The same steps should work on later versions of Ubuntu. The original gist is from my old GitHub account gist https://gist.github.com/application2000/73fd6f4bf1be6600a2cf9f56315a2d91 \
USAGE: ``` docker image build --build-arg BASE_IMAGE=ubuntu:14.04 --build-arg WANTED_GCC_VERSION=9 -f Dockerfile -t 'alexandreelise/install-gcc:9-ubuntu-14.04' . ```"

ARG WANTED_GCC_VERSION
ENV WANTED_GCC_VERSION="${WANTED_GCC_VERSION:-9}"
ENV TZ=UTC
    
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get install build-essential software-properties-common -y && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
    apt-get update -y && \
    apt-get install gcc-"${WANTED_GCC_VERSION}" g++-"${WANTED_GCC_VERSION}" -y && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-"${WANTED_GCC_VERSION}" 60 --slave /usr/bin/g++ g++ /usr/bin/g++-"${WANTED_GCC_VERSION}" && \
    update-alternatives --set gcc /usr/bin/gcc-"${WANTED_GCC_VERSION}"

ENTRYPOINT [ "/usr/bin/gcc" ]

CMD [ "--version" ]

VOLUME /opt

WORKDIR /opt

HEALTHCHECK CMD if [ -f "/usr/bin/gcc" ]; then exit 0; else exit 1; fi
