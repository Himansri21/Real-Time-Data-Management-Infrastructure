#download the source code using wget 
wget https://dlcdn.apache.org/flink/flink-2.1.1/flink-2.1.1-bin-scala_2.12.tgz

#or use docker to get and run apache-flink
docker run -it --rm -p 8081:8081 apache/flink:2.1.1

#starting flink 
./bin/start-cluster.sh

#you should now see the ui at port 8081
