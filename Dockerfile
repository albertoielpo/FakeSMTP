# Starting from jdk 8 alpine
FROM openjdk:8-jdk-alpine
# Build from source
RUN apk add git
# Clone from stable tag
RUN git clone -b v1.0.0 https://github.com/albertoielpo/FakeSMTP.git
WORKDIR /FakeSMTP
# Locally tests works, needs to checks why here it's not working. For now leave skipTests true
RUN ./mvnw clean install -DskipTests=true
RUN cp target/fakeSMTP-2.1-SNAPSHOT.jar ../fakeSMTP.jar
WORKDIR /
# output will contains all mails
RUN mkdir -p /output
# Remove build files
RUN rm -rf FakeSMTP
# SMTP 25, port mapping in docker-compose
EXPOSE 25
ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]