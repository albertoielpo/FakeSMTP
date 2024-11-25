FROM java:8

RUN mkdir -p /output

ADD fakeSMTP-2.1.0.jar /fakeSMTP.jar

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]
