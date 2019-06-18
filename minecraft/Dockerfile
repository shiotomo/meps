FROM openjdk:latest

RUN mkdir /workspace
WORKDIR /workspace

RUN yum update -y
RUN yum install -y wget

CMD bash init.sh && java -Xmx1024M -Xms1024M -jar server.jar nogui
