#!/usr/bin/env sh

UBUNTU_LTS_VERSION_LIST="14.04 16.04 18.04 20.04 22.04"
GCC_RELEASE_VERSION_LIST="6.1 6.2 6.3 6.4 6.5 7.1 7.2 7.3 7.4 7.5 8.1 8.2 8.3 8.4 8.5 9.1 9.2 9.3 9.4 9.5 10.1 10.2 10.3 10.4 11.1 11.2 11.3 11.4 12.1 12.2 12.3"
for a in ${UBUNTU_LTS_VERSION_LIST}; do
  
  echo "[START]: Building Docker image for Ubuntu $a LTS"
   
  for b in ${GCC_RELEASE_VERSION_LIST}; do

     echo "[START]: Building Docker image on Ubuntu $a LTS installing gcc version $b" && \
     docker image build --build-arg BASE_IMAGE=ubuntu:"${a}" --build-arg WANTED_GCC_VERSION="${b}" -f Dockerfile -t "alexandreelise/install-gcc:${b}-ubuntu-${a}" . && \
     echo "[END]: Building Docker image on Ubuntu $a LTS installing gcc version $b"

  done;

  echo "[END]: Building Docker image for Ubuntu $a LTS"

done;
