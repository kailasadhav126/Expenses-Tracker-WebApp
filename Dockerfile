# -------------------------------
# Stage 1 - Build
# -------------------------------
FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app
COPY . /app

RUN mvn clean install -DskipTests=true

# -------------------------------
# Stage 2 - Runtime
# -------------------------------
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=builder /app/target/*.jar /app/expenseapp.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/expenseapp.jar"]
