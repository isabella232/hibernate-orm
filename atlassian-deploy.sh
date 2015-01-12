#! /bin/sh

TAG=3.6.10.Final-atlassian-4
JAR_PATTERN="*${TAG}.jar"

# mvn clean source:jar package -DskipTests -Djdk16_home=$JAVA_HOME -DdisableDistribution=true

# deploy parent pom
mvn deploy:deploy-file -Dfile=hibernate-parent/pom.xml -DpomFile=hibernate-parent/pom.xml \
    -DrepositoryId=atlassian-3rdparty \
    -Durl=https://maven.atlassian.com/3rdparty

# deploy all the JARs with source JARs when they exist
find . -name ${JAR_PATTERN} | while read jar; do
    pom=`echo $jar | sed -e 's/\/target\/.*jar$/\/pom.xml/'`
    sourceJar=`echo $jar | sed -e 's/\.jar$/-sources.jar/'`

    DEPLOY_ARGS="-Dfile=${jar} -DpomFile=${pom}"

    if [ -f ${sourceJar} ]; then
        DEPLOY_ARGS="${DEPLOY_ARGS} -Dsources=${sourceJar}"
    fi

    mvn deploy:deploy-file ${DEPLOY_ARGS} \
        -DrepositoryId=atlassian-3rdparty \
        -Durl=https://maven.atlassian.com/3rdparty
done