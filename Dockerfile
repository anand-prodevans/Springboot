FROM java:8
EXPOSE 8080
ADD /target/Springboot.jar Springboot.jar 
ENTRYPOINT ["java","-jar","Springboot.jar"]
