docker build -t jingyanwang1/spanish_spelling_check:1.0.1 .

docker run -it `
-p 0.0.0.0:7791:7791 `
jingyanwang1/spanish_spelling_check:1.0.1



flask --app spell_checker_web_interface --debug run --port=7791

docker exec -it 2e511492a1db bash

wget http://127.0.0.1:7791/spanish_spell_checker


http://127.0.0.1:7791/spanish_spell_checker

http://0.0.0.0:7791/spanish_spell_checker

localhost:7791/spanish_spell_checker

curl http://localhost:7791/spanish_spell_checker

2e511492a1db:7791/spanish_spell_checker

############Dockerfile###########
FROM openjdk:8u292-jre

RUN apt-get update
RUN apt-get install -y bzip2 
RUN apt-get install -y wget
RUN apt-get install -y gcc 
RUN apt-get install -y git 
RUN apt-get install -y curl
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip

RUN pip3 install gdown==3.12.2
RUN pip3 install requests==2.24.0
RUN pip3 install pandas==1.1.3

####
USER root

RUN mkdir /yan
RUN mkdir /home/yan

RUN chmod 777 /home/*
RUN chmod 777 /yan
RUN chmod 777 /home/yan

RUN useradd -u 8877 yan

####

RUN pip3 install xlrd==1.1.0
RUN pip3 install xlsxwriter==1.4.3
RUN pip3 install pyspark==3.1.1
RUN pip3 install Pillow==8.2.0

RUN pip3 install autocorrect==2.6.1
RUN pip3 install Flask==2.2.2

ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3

############
USER root

RUN python3 -c "from autocorrect import Speller;spanish_spelling_checker = Speller('es')"

EXPOSE 7791

RUN echo "ssgdgmk"

ADD *.py /
ADD templates /templates

CMD flask --app spell_checker_web_interface --debug run --port=7791

############Dockerfile############