FROM maven:3.5.4-jdk-8-alpine AS mvnbuild
ADD src src
ADD pom.xml pom.xml
RUN mvn clean package -Dmaven.test.skip=true

FROM java:8
ARG APP_NAME=k8s-springboot-demo
VOLUME /data/$APP_NAME
COPY --from=mvnbuild target/$APP_NAME.jar $APP_NAME.jar
RUN bash -c "touch $APP_NAME.jar"
ENTRYPOINT ["java","-jar","$APP_NAME.jar"]