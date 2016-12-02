#sbt compile avro schema
sbt clean compile publish-local

# Generate gradle wrapper
gradle wrapper

#invalidate cache
delete everything under .gradle/cache
IntelliJ/File/Invalidate and Restart

# Build and test
./gradlew clean test --debug
./gradlew clean build
./gradlew clean build --refresh-dependencies
# Publish to local .M2
./gradlww clean install

#Run spring boot apps
./gradlew bootRun

#List tasks
./gradlew task
