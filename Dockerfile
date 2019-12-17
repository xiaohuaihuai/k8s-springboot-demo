FROM maven:3.5.4-jdk-8-alpine AS mvnBuild
VOLUME /data/k8s-springboot-demo
ADD ./src src/
ADD ./pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
VOLUME /data/k8s-springboot-demo
COPY --from=mvnBuild target/k8s-springboot-demo.jar k8s-springboot-demo.jar
RUN bash -c 'touch k8s-springboot-demo.jar'
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]
