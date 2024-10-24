#!/bin/bash
# Build the Java application
javac -d out src/com/example/MyApplication.java
# Create a runnable JAR
echo "Main-Class: com.example.MyApplication" > manifest.txt
jar cfm my-java-app.jar manifest.txt -C out .
