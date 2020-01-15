FROM openjdk:latest

RUN mkdir /workspace
WORKDIR /workspace

RUN yum update -y
RUN yum install -y wget

CMD bash init.sh && java -Xmx512M -Xms512M -jar server.jar nogui
