#Stage 1: Build

#This stage uses the ubuntu image and is labelled as 'build'
FROM ubuntu:latest AS  build

#Install the dependencies
RUN apt update -y && apt install openjdk-21-jdk -y && apt install maven -y

#Sets the working directory inside the container
WORKDIR /app

#Copies the files and directories to the container
COPY . /app

#Creates the Build Package or Artefact using Maven
RUN mvn clean package -DSkipTests

#Stage 2: run
#This stage uses the light weight image labelled as 'run'
FROM openjdk-21-jdk AS run

#Sets the working directory inside the container
WORKDIR /app

#Copies the build artefacts from the Build Stage to the current stage
COPY --from=BUILD /app/target/learningapp-0.0.1-SNAPSHOT.jar /app/lcspringboot.jar

#Expose the port that App runs on 
EXPOSE 8080

#Executable to run the Application
ENTRYPOINT ["java", "-jar", "lcspringboot.jar"]
