FROM ubuntu:18.04
ADD https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 .
RUN apt-get update
RUN apt-get install -y autoconf automake make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev
RUN tar -xvjf samtools-1.10.tar.bz2
WORKDIR /samtools-1.10
RUN ./configure --prefix=/SOFT
RUN make
RUN make install
