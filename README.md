# k8s-springboot-demo

## maven build a jar

----
	$ ./mvnw clean package -Dmaven.test.skip=true
	或
	$ mvn clean package -Dmaven.test.skip=true
----

## docker build a image

----
	$ docker build -t yangqiuhua/k8s-springboot-demo:latest .
----

## docker run a container with a image

----
    $ docker-compose up -d
    或
	$ docker run -d -p 8080:8080 --name k8s-springboot-demo yangqiuhua/k8s-springboot-demo:latest
----