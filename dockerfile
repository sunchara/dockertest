FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install autoconf automake make gcc perl zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev libperl-dev libgsl0-dev -y git

RUN git clone https://github.com/samtools/samtools.git
RUN git clone https://github.com/samtools/bcftools.git
RUN git clone https://github.com/samtools/htslib.git
RUN git clone https://github.com/ebiggers/libdeflate.git

#bcftools    biobambam   htslib    libdeflate  samtools

WORKDIR /libdeflate
RUN make \
  && make install

WORKDIR /htslib
RUN autoheader && \
    autoconf && \
    ./configure --with-libdeflate --prefix=/SOFT && \
    make && \
    make install

WORKDIR /bcftools
RUN autoheader && \
    autoconf && \
    ./configure  --prefix=/SOFT && \
    make && \
    make install

WORKDIR /samtools
RUN autoheader && \
    autoconf && \
    ./configure  --prefix=/SOFT && \
    make && \
    make install

WORKDIR /
