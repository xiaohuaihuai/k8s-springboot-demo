FROM maven:3.5.4-jdk-8-alpine AS mvnbuild
ADD src src
ADD pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
VOLUME /data/k8s-springboot-demo
WORKDIR /data/k8s-springboot-demo
COPY --from=mvnbuild target/k8s-springboot-demo.jar /data/k8s-springboot-demo/k8s-springboot-demo.jar
RUN bash -c "touch k8s-springboot-demo.jar"
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]