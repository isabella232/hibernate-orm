#! /bin/sh

TAG=3.6.10.Final-atlassian-4

JAR_PATTERN="*${TAG}.jar"

find . -name ${JAR_PATTERN} | while read jar; do
    echo $jar
done