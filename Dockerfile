FROM maven:3.6.3-jdk-8
MAINTAINER yangqiuhua
LABEL author="yangqiuhua" since="2019-12-19"

VOLUME /data/k8s-springboot-demo

RUN ls -l /data/k8s-springboot-demo
ADD src /data/k8s-springboot-demo/src
ADD pom.xml /data/k8s-springboot-demo/pom.xml
RUN ls -l /data/k8s-springboot-demo
RUN cd /data/k8s-springboot-demo;mvn clean package -Dmaven.test.skip=true
RUN pwd
RUN ls -l /data/k8s-springboot-demo
RUN cp /data/k8s-springboot-demo/target/k8s-springboot-demo.jar /data/k8s-springboot-demo/k8s-springboot-demo.jar
RUN ls -l /data/k8s-springboot-demo
ENTRYPOINT ["java","-jar","/data/k8s-springboot-demo/k8s-springboot-demo.jar"]