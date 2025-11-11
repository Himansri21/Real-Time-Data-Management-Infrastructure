import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaProducer;
import java.util.Properties;

public class StreamingJob {
    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        // Kafka properties
        Properties properties = new Properties();
        properties.setProperty("bootstrap.servers", "localhost:9092");
        properties.setProperty("group.id", "flink-group");
        // Source: Kafka Consumer
        FlinkKafkaConsumer<String> consumer = new FlinkKafkaConsumer<>(
            "input_topic",
            new SimpleStringSchema(),
            properties
        );
        // Sink: Kafka Producer
        FlinkKafkaProducer<String> producer = new FlinkKafkaProducer<>(
            "output_topic",
            new SimpleStringSchema(),
            properties
        );
        // Processing Pipeline
        env.addSource(consumer)
           .map(value -> "Processed: " + value) // Simple transformation
           .addSink(producer);
        // Execute Flink Job
        env.execute("Flink Kafka Streaming Job");
    }
}