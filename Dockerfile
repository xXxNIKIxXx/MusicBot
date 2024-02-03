FROM adoptopenjdk:16-jre-hotspot

WORKDIR /app
RUN mkdir /Playlists

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/jagrosh/MusicBot/releases/download/$(curl --silent -qI https://github.com/jagrosh/MusicBot/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')/JMusicBot-$(curl --silent -qI https://github.com/jagrosh/MusicBot/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}').jar

RUN mv JMusicBot-$(curl --silent -qI https://github.com/jagrosh/MusicBot/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}').jar JMusicBot.jar

ENTRYPOINT ["java", "-Dnogui=true", "-Xmx256M", "-jar", "/app/JMusicBot.jar"]
