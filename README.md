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
    $ docker run -p 8070:8090 \
    -e server.port=8090 -e logging.level.root=DEBUG -e logging.file.name=/data/logs/k8s-springboot-demo/k8s-springboot-demo.log \
    --name k8s-springboot-demo -d yangqiuhua/k8s-springboot-demo:latest
    
	#linux 宿主机data/logs目录挂载到容器data/logs目录
	$ docker run -p 8070:8090 -v /data/logs:/data/logs \
	-e server.port=8090 -e logging.level.root=DEBUG -e logging.file.name=/data/logs/k8s-springboot-demo/k8s-springboot-demo.log \
	--name k8s-springboot-demo -d yangqiuhua/k8s-springboot-demo:latest
	
	#windows cmd窗口 宿主机E盘data/logs目录挂载到容器data/logs目录
	$ docker run -p 8070:8090 -v E:\data\logs:/data/logs -e server.port=8090 -e logging.level.root=DEBUG -e logging.file.name=/data/logs/k8s-springboot-demo/k8s-springboot-demo.log --name k8s-springboot-demo -d yangqiuhua/k8s-springboot-demo:latest
----

## k8s deploy

----
    $ kubectl apply -f kubectl.yml
    或
	$ kubectl create -f kubectl.yml
----
