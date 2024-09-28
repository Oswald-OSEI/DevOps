# Use an official OpenJDK 22 as a parent image
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from your local machine to the container
COPY target/SpringData-0.0.1-SNAPSHOT.jar /app/myapp.jar

# Expose the application port (e.g., 8080)
EXPOSE 8080

# Set environment variables for the database connection
ENV SPRING_DATASOURCE_URL=jdbc:mysql://db:3306/mydb


# Run the application
CMD ["java", "-jar", "myapp.jar"]
