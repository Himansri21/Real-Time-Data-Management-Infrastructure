from kafka import KafkaConsumer
import psycopg2

consumer = KafkaConsumer(
    'output_topic',
    bootstrap_servers='localhost:9092',
    auto_offset_reset='earliest',
    group_id='postgres-group'
)
conn = psycopg2.connect(
    database="streaming_db",
    user="user",
    password="password",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()
for message in consumer:
    data = message.value.decode('utf-8')
    cursor.execute("INSERT INTO processed_data (value) VALUES (%s)", (data,))
    conn.commit()
cursor.close()
conn.close()