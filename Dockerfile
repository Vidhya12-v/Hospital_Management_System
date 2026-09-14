# ---------- Stage 1: Build the WAR ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B

COPY src ./src
RUN ./mvnw clean package -DskipTests

# ---------- Stage 2: Run the WAR ----------
FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=build /app/target/Hospital_Management_System-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "java -jar app.war --server.port=${PORT:-8080}"]