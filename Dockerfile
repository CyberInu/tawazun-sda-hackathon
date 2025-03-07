FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn package

# Set the working directory in the container
WORKDIR /app

# Set environment variables
# ENV GOLDEN_DB_URL=mysql_goldenwaste
# ENV GOLDEN_DB_PORT=3306
# ENV GOLDEN_DB_NAME=goldenwaste_db
# ENV GOLDEN_DB_USERNAME=goldenuser
# ENV GOLDEN_DB_PASSWORD=password

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 8080
EXPOSE 8080