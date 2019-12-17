# k8s-springboot-demo

## maven build

----
	$ ./mvnw clean package -Dmaven.test.skip=true
	或
	$ mvn clean package -Dmaven.test.skip=true
----

## docker build

----
	$ docker build -t yangqiuhua/k8s-springboot-demo:latest .
----

## docker run

----
	$ docker run -d -p 8080:8080 --name k8s-springboot-demo yangqiuhua/k8s-springboot-demo:latest
	$ docker-compose up -d
----