build:
	docker-compose build
	
up:
	docker-compose up -d

down:
	docker-compose down	

restart:
	make down && make up

copy_jars:
	docker cp jars/aws-java-sdk-1.12.367.jar spark-master:/opt/bitnami/spark/jars
	docker cp jars/s3-2.18.41.jar spark-master:/opt/bitnami/spark/jars
	docker cp jars/delta-core_2.12-2.2.0.jar spark-master:/opt/bitnami/spark/jars
	docker cp jars/delta-storage-2.2.0.jar spark-master:/opt/bitnami/spark/jars
	docker-compose restart spark-master
