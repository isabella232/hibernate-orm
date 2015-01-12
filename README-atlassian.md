How to build
============

export JAVA_HOME=$JAVA6_HOME
export PATH=$JAVA_HOME/bin:$PATH

mvn clean install -DskipTests -Djdk16_home=$JAVA6_HOME -DdisableDistribution=true

How to release
==============

export JAVA_HOME=$JAVA6_HOME
export PATH=$JAVA_HOME/bin:$PATH

mvn release:prepare -Darguments="-DskipTests -Djdk16_home=$JAVA6_HOME -DdisableDistribution=true" -DdisableDistribution=true
mvn release:perform -Darguments="-DskipTests -Djdk16_home=$JAVA6_HOME -DdisableDistribution=true" -DdisableDistribution=true