# dockertest

Dockerfile для создания контейнера со сборкой
bcftools
htslib
libdeflate
samtools в /SOFT


собираем проект


docker build -t dockertest .


запускаем


docker run -it dockertest
