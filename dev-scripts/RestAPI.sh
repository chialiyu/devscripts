#Plan
 - DB: MySQL / Postgresql
 - Hibernate/myBatis/ORM in a project
 - JUnit
 - Spring MVC
 - JUnit/Spoc to verify
 - By category

 # Good Post
 # https://springframework.guru/spring-boot-web-application-part-1-spring-initializr/

 # Dependency tree
 mvn dependency:tree

 #Traditionally, app uses java server pages/jsp
 #Thymeleaf read location
 /resources/templates


 H2 - build portable

 # IntelliJ/Spring Initializr
 #install MySQL - Root password
2016-11-07T12:02:42.006303Z 1 [Note] A temporary password is generated for root@localhost: okjr+ivzN6!r
If you lose this password, please consult the section How to Reset the Root Password in the MySQL reference manual.

Import




#Maven
brew install Maven
#In folder with pom.xml
mvn install
mvn clean test
mvn clean spring-boot:run

#Spring Boot Starter Security
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>

#myRetail
./gradlew bootrun

# Test
http://localhost:8080



# Things to consider
1. How to migrate database with Spring Data/JPA/Hibernate?

# Learn More
1. VisualVM
2. Spring/Java concurrency
3. Tomcat threading/asyncServlet - 150/2 threads per core

# IntegrationTest
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
