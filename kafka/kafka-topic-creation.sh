#create input and output topics in kafka
bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic input-topic
bin/kafka-topics.sh --bootstrap-server localhost:9092 --create --topic output-topic