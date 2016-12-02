

#Run Scala (compiled into xxxx.class)
scala -cp . <class name that contains main func>

#Generate gradle wrapper
gradle wrapper --gradle-version 2.3
gradle wrapper

#Run gradle
./gradlew task
./gradlew clean build
./gradlew clean build test

#Run gradle with Java Parameter
./gradlew integrationTest -Dcae.environment=ci

#Run spring boot job
./gradle bootrun

#Java
#Check jar content
jar tf jar-file

#Extract jar content
jar xvf file.jar
