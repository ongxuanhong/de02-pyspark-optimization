# de02-pyspark-optimization

Spawn Spark and Jupyter notebook (spark 3.3.1 with bitnami version)
```bash
make up
```

Get Jupyter notebook token
```bash
docker logs spark-notebook
```

Open Jupyter notebook
http://localhost:8888/lab?token=abcxyz

Spark UI
* Master: http://localhost:8080/
* Jobs: http://localhost:4040/jobs/

MinIO UI
* http://localhost:9001/
* Create a testfile.txt with lorem contents and upload to warehouse

## Install Jars
```bash
# download new jars
mkdir -p jars/ && cd jars/
wget https://repo1.maven.org/maven2/software/amazon/awssdk/s3/2.18.41/s3-2.18.41.jar
wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.12.367/aws-java-sdk-1.12.367.jar
wget https://repo1.maven.org/maven2/io/delta/delta-core_2.12/2.2.0/delta-core_2.12-2.2.0.jar
wget https://repo1.maven.org/maven2/io/delta/delta-storage/2.2.0/delta-storage-2.2.0.jar

# copy new jars
docker cp aws-java-sdk-1.12.367.jar spark-master:/opt/bitnami/spark/jars
docker cp s3-2.18.41.jar spark-master:/opt/bitnami/spark/jars
docker cp delta-core_2.12-2.2.0.jar spark-master:/opt/bitnami/spark/jars
docker cp delta-storage-2.2.0.jar spark-master:/opt/bitnami/spark/jars

# check files
docker exec spark-master ls -la jars | grep aws-java-sdk
docker exec spark-master ls -la jars | grep s3
docker exec spark-master ls -la jars | grep delta

# restart docker
docker-compose restart spark-master
```