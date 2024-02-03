FROM openjdk:16
WORKDIR /app
RUN mkdir /Playlists

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/jagrosh/MusicBot/releases/download/0.3.9/JMusicBot-0.3.9.jar .

ENTRYPOINT ["java", "-Dnogui=true", "-Xmx256M", "-jar", "/JMusicBot-0.3.9.jar"]