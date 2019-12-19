FROM maven:3.5.4-jdk-8-alpine AS mvnbuild
MAINTAINER yangqiuhua
ADD src src
ADD pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
MAINTAINER yangqiuhua
VOLUME /data/k8s-springboot-demo
COPY --from=mvnbuild target/k8s-springboot-demo.jar k8s-springboot-demo.jar
RUN ls -l /
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]