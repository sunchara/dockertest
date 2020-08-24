FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install autoconf automake make gcc perl git -y && \
    apt-get install zlib1g-dev libbz2-dev liblzma-dev libcurl4-gnutls-dev libssl-dev libncurses5-dev libperl-dev libgsl0-dev -y

#bcftools   htslib    libdeflate  samtools

WORKDIR /SOURCES
RUN git clone https://github.com/ebiggers/libdeflate.git
WORKDIR /SOURCES/libdeflate
RUN  make all && make install #  LIBDIR=/SOFT

WORKDIR  /SOURCES
RUN git clone https://github.com/samtools/htslib.git
WORKDIR  /SOURCES/htslib
RUN autoheader && \
    autoconf && \
    ./configure --bindir=/SOFT && \
    make && \
    make install

WORKDIR /SOURCES
RUN git clone https://github.com/samtools/bcftools.git
WORKDIR /SOURCES/bcftools
RUN autoheader && \
    autoconf && \
    ./configure  --bindir=/SOFT && \
    make && \
    make install


WORKDIR  /SOURCES
RUN git clone https://github.com/samtools/samtools.git
WORKDIR /SOURCES/samtools
RUN autoheader && \
    autoconf && \
    ./configure  --bindir=/SOFT && \
    make && \
    make install

ENV PATH /SOFT:$PATH
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
WORKDIR /
