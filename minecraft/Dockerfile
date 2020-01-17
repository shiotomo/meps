FROM openjdk:latest

RUN mkdir /workspace
WORKDIR /workspace
# ADD ./minecraft /workspace

RUN yum update -y
RUN yum install -y wget

CMD java -Xmx512M -Xms512M -jar server.jar nogui
