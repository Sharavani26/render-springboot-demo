FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY src ./src

RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

EXPOSE 10000

CMD ["sh", "-c", "java -jar target/renderdemo-0.0.1-SNAPSHOT.jar --server.port=${PORT:-10000} --server.address=0.0.0.0"]

