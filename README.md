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
	$ docker run -d -p 8070:8090 -e server.port=8090 -e logging.level.root=DEBUG --name k8s-springboot-demo yangqiuhua/k8s-springboot-demo:latest
----

## k8s deploy

----
    $ kubectl apply -f k8s-springboot-demo.yaml
    或
	$ kubectl create -f k8s-springboot-demo.yaml
----