FROM ubuntu:bionic

LABEL Irene Liampa <irini.liampa@.gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libgd-dev libgif-dev nano git unzip python-gd python-pil python-matplotlib python-biopython python-numpy python-pip
    
RUN python --version
    
RUN pip install numpy pandas Pillow matplotlib gdmodule biopython 

#download from github
RUN mkdir -p /app/ && cd /app && git clone https://github.com/lorrainea/IsoXpressor.git 

# Install prerequisites
RUN cd /app/IsoXpressor && bash ./pre-install.sh 
RUN ln -s /app/IsoXpressor/IsoXpressor.py /usr/local/bin/isoxpressor

WORKDIR /app/IsoXpressor
CMD python /app/IsoXpressor/IsoXpressor.py
