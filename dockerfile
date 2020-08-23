FROM ubuntu:18.04
COPY hello.txt /hello/hello.txt


RUN cat /hello/hello.txt
CMD bash
