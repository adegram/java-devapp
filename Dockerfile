# 1. Use a maintained base image (Eclipse Temurin is the industry standard now)
FROM eclipse-temurin:17-jre-alpine

# 2. Create and set the working directory first
WORKDIR /app

# 3. Use a non-root user for better security
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# 4. Copy the JAR using a wildcard to avoid version-lock issues
# This assumes only one JAR exists in that folder
COPY build/libs/*.jar app.jar

# 5. Inform Docker that the container listens on 8080
EXPOSE 8080

# 6. Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]