#wget the file source and extract it 
wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.tar.gz

tar -zxf apache-maven-3.9.11-bin.tar.gz

sudo cat > /etc/profile.d/maven.sh << EOF
export MAVEN_HOME="path to maven directory"
export PATH=$PATH:$MAVEN_HOME/bin
EOF

#create a maven project for flink using below command 
mvn archetype:generate -DarchetypeGroupId=org.apache.flink -DarchetypeArtifactId=flink-quickstart-java -DarchetypeVersion=1.16.0 -DgroupId=com.example -DartifactId=flink-streaming-job
