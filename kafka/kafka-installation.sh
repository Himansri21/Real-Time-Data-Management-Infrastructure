#get kafka from source
wget https://dlcdn.apache.org/flink/flink-2.1.1/flink-2.1.1-bin-scala_2.12.tgz

#unzip and open kafka
tar -xzf kafka_2.13-4.1.0.tgz
$ cd kafka_2.13-4.1.0

#create a Cluster ID variable that is global 
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

#create format for the log directories 
bin/kafka-storage.sh format --standalone -t $KAFKA_CLUSTER_ID -c config/server.properties

#start kafka server 
bin/kafka-server-start.sh config/server.properties