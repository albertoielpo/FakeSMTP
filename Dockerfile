FROM openjdk:8-jdk-alpine
COPY target/fakeSMTP-2.1-SNAPSHOT.jar fakeSMTP.jar
RUN mkdir -p /output
EXPOSE 25
ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]