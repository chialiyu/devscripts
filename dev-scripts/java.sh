#Compile/run from command line
javac <filename.java>
javac -cp "/users/z037900/Dev/slf4j-1.7.21/slf4j-api-1.7.21.jar" Slf4jHelloWorld.java
java -cp .:slf4j-api-1.7.21.jar:slf4j-simple-1.7.21.jar Slf4jHelloWorld

javac -cp "./slf4j-json-logger-2.0.2.jar" JsonSlf4jHelloWorld.java
java -cp ".:./jars/slf4j-json-logger-2.0.2.jar:./jars/commons-lang3-3.3.1.jar" JsonSlf4jHelloWorld
java -cp ".:./jars/slf4j-api-1.7.21.jar:./jars/slf4j-json-logger-2.0.2.jar:./jars/commons-lang3-3.3.1.jar:./jars/gson-2.3.1.jar:./jars/slf4j-simple-1.7.21.jar:" JsonSlf4jHelloWorld

#Run java program
java -classpath . <classname>
#dump class file content
javap <filename.class>
#dump jar content
jar tf <jar-file>

mvn clean install
mvn clean test
mvn clean tomcat7:run -e
mvn verify (instead of "mvn integration-test")

#Camel
mvn camel:run
mvn spring-boot:run
