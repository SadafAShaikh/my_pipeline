FROM openjdk:17-jdk-alpine


# Set the working directory inside the container
WORKDIR /usr/src/app


# Copy the current directory contents into the container
COPY . .


# Compile the Java source file
RUN javac Main_1.java


# Run the compiled Java program
CMD ["java", "Main_1"]
