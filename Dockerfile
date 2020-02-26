FROM openjdk:15-alpine
LABEL maintainer="blaavlaa@solita.fi"

ARG UID=101
ARG GID=101

COPY app/build/libs/rest-service-0.0.1-SNAPSHOT.jar /app/awesome.jar
RUN ( addgroup -S app_group --gid $GID || true ) && \
    adduser -S --uid $UID --shell /sbin/nologin -g $GID app_user && \
    chown -R $UID:$GID /app

USER app_user

ENTRYPOINT ["java", "-jar", "/app/awesome.jar"]
