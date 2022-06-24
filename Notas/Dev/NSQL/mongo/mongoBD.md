# Configurar timezone mongo-docker (Dockerfile)
 # set noninteractive installation
    export DEBIAN_FRONTEND=noninteractive
    # install tzdata package
    apt-get install -y tzdata
    # set your timezone
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
    dpkg-reconfigure --frontend noninteractive tzdata

# Configurar mongo desde docker-compose
version: '3.7'
services:
  timezone:
    build: .
    environment:
      - TZ=America/New_York
      - DEBIAN_FRONTEND=noninteractive
