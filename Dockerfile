FROM maven:3.5.4-jdk-8-alpine AS mvnbuild
MAINTAINER yangqiuhua
LABEL author="yangqiuhua" since="2019-12-19"
WORKDIR /data/k8s-springboot-demo
ADD src src
ADD pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true
#RUN chmod 755 /data/k8s-springboot-demo/target/k8s-springboot-demo.jar

FROM openjdk:8-alpine
MAINTAINER yangqiuhua
LABEL author="yangqiuhua" since="2019-12-19"
WORKDIR /data/k8s-springboot-demo
VOLUME /data/logs
COPY --from=mvnbuild /data/k8s-springboot-demo/target/k8s-springboot-demo.jar k8s-springboot-demo.jar
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]
