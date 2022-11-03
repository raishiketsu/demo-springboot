# Spring REST Hello World Example

Article link : https://www.mkyong.com/spring-boot/spring-rest-hello-world-example/

## 1. 事前準備
Google Cloud の　CloudShellは予めmavenをインストールしています。
そうじゃない場合はmavenをインストールします。
```
$ apt install maven
```

## 2.git からソースコードをcloneし、テスト実行
```
$ git clone https://github.com/mkyong/spring-boot.git
$ cd spring-rest-hello-world
$ mvn spring-boot:run

$ curl -v localhost:8080/books
```

Build and skip test
```
$ mvn clean package -Dmaven.test.skip=true
```

Run jar
```
$ java -jar target/spring-rest-hello-world-1.0.jar 
```

## 3.イメージのBuild

$ docker build -t demo-springboot .
```
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
```

## 4.コンテナ実行
```
$ docker run -d -p 8080:8080 demo-springboot
$ mvn spring-boot:run
```

## 5.イメージをプッシュ
コンテナを実行しレスポンスが２００で問題なくアクセスできるなら、イメージをdocker hub などにプッシュ
