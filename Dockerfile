FROM maven:3.6.3-openjdk-8-slim AS builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:8-jre-alpine3.9

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo 'Asia/Tokyo' >/etc/timezone

COPY --from=builder /app/target/*.jar /app.jar

EXPOSE 8080

ENV JAVA_OPTS=""
ENV PARAMS=""

ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar /app.jar $PARAMS" ]
