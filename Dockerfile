FROM java:8
EXPOSE 8080

VOLUME /tmp
ADD target/k8s-springboot-demo-0.0.1-SNAPSHOT.jar /k8s-springboot-demo.jar
RUN bash -c 'touch /k8s-springboot-demo.jar'
ENTRYPOINT ["java","-jar","k8s-springboot-demo.jar"]
