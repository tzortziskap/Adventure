FROM maven:3-eclipse-temurin-8-alpine
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app
COPY . .
RUN mvn clean package
EXPOSE 8080
CMD ["java","-jar", "target/adventure-0.0.1.jar"]
#docker build -t adventure-image .
#docker run -p 8080:8080 --name adventure --network adventure-mysql -it adventure-image