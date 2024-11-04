# Build Stage
FROM openjdk:17-jdk-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN javac Main_1.java

# Final Stage
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=builder /usr/src/app/Main_1.class .
ENTRYPOINT ["java", "Main_1"]
