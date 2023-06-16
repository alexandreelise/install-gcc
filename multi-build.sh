#!/usr/bin/env sh

UBUNTU_LTS_VERSION_LIST="14.04 16.04 18.04 20.04 22.04"
GCC_VERSION_LIST="6 7 8 9 10 11 12 13"
for a in ${UBUNTU_LTS_VERSION_LIST}; do
  
  echo "[START]: Building Docker image for Ubuntu $a LTS"
   
  for b in ${GCC_VERSION_LIST}; do

     { \
     echo "[START]: Building Docker image on Ubuntu $a LTS installing gcc version $b" && \
     docker image build --build-arg BASE_IMAGE=ubuntu:"${a}" --build-arg WANTED_GCC_VERSION="${b}" -f Dockerfile -t "yourusername/install-gcc:${b}-ubuntu-${a}" . && \
     echo "[END]: Building Docker image on Ubuntu $a LTS installing gcc version $b" ; } &

  done;

  echo "[END]: Building Docker image for Ubuntu $a LTS"

done;
