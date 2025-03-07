# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11 AS build
# Set the working directory inside the container
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app

# Download Maven dependencies (this step will cache dependencies for faster builds)
RUN mvn dependency:resolve dependency:resolve-plugins

# Run the Maven build (e.g., to package the application)
RUN mvn package

# Set the working directory in the container
WORKDIR /app

# Specify the entry point for the container (optional if running a standalone app)
CMD ["mvn","spring-boot:run"]
# Expose port 8080
EXPOSE 8080