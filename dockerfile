FROM ubuntu:18.04
COPY hello.txt /hello/hello.txt
RUN cat /hello/hello.txt
ADD https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 .
RUN tar -xvjf samtools-1.10.tar.bz2
RUN cd samtools-1.10
RUN ./configure --prefix=/SOFT
RUN make
RUN make install
