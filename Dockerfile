FROM adoptopenjdk:16-jre-hotspot

WORKDIR /app
RUN mkdir /Playlists

RUN apt-get update && apt-get install -y wget

RUN export VER=$(curl --silent -qI https://github.com/jagrosh/MusicBot/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')
RUN wget https://github.com/jagrosh/MusicBot/releases/download/$VER/JMusicBot-$VER.jar

ENTRYPOINT ["java", "-Dnogui=true", "-Xmx256M", "-jar", "/app/JMusicBot-$VER.jar"]
