FROM openjdk:latest

RUN mkdir /app
WORKDIR /app

CMD java -Xmx1024M -Xms1024M -jar server.jar nogui
