FROM maven:3.5.4-jdk-8-alpine AS mvnbuild
MAINTAINER yangqiuhua
WORKDIR /data/k8s-springboot-demo
ADD src /data/k8s-springboot-demo/src
ADD pom.xml /data/k8s-springboot-demo/pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
MAINTAINER yangqiuhua
WORKDIR /data/k8s-springboot-demo
VOLUME /data/k8s-springboot-demo
COPY --from=mvnbuild /data/k8s-springboot-demo/target/k8s-springboot-demo.jar /data/k8s-springboot-demo/k8s-springboot-demo.jar
RUN bash -c "touch /data/k8s-springboot-demo/k8s-springboot-demo.jar"
RUN ls -l /
RUN ls -l /data
RUN ls -l /data/k8s-springboot-demo
ENTRYPOINT ["java","-jar","/data/k8s-springboot-demo/k8s-springboot-demo.jar"]