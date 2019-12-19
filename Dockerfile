FROM maven:3.5.4-jdk-8-alpine
MAINTAINER yangqiuhua
LABEL author="yangqiuhua" since="2019-12-19"
RUN ls -l /
WORKDIR /data/k8s-springboot-demo
VOLUME /data/k8s-springboot-demo
ADD src src
ADD pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true
RUN cp target/k8s-springboot-demo.jar k8s-springboot-demo.jar
RUN ls -l /
RUN ls -l /data/k8s-springboot-demo
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]