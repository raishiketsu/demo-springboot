# Spring REST Hello World Example

Article link : https://www.mkyong.com/spring-boot/spring-rest-hello-world-example/

## 1. How to start
If not Google Cloud CloudShell
```
$ apt install maven
```
```
$ git clone https://github.com/mkyong/spring-boot.git
$ cd spring-rest-hello-world
$ mvn spring-boot:run

$ curl -v localhost:8080/books
```

Build and skip test
```
mvn clean package -Dmaven.test.skip=true
```

Run jar
```
java -jar target/spring-rest-hello-world-1.0.jar 
```
