FROM openjdk:15-alpine
LABEL maintainer="blaavlaa@solita.fi"

RUN addgroup -S app_group && \
    adduser -S --shell /sbin/nologin -g app_appgroup app_user

RUN mkdir /app
COPY awesome.jar /app
RUN chown -R app_user:app_group /app

USER app_user

ENTRYPOINT ["java", "-jar", "/app/awesome.jar"]
