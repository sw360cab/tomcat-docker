FROM ubuntu

MAINTAINER Sergio Matone

# ADD JAVA repo
RUN apt-get update && apt-get install -y curl \
  python-software-properties \
  software-properties-common \
  && add-apt-repository ppa:webupd8team/java

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && apt-get update && apt-get -y install oracle-java7-installer

#  install Tomcat
RUN mkdir -p /opt/tomcat \
 && curl -SL http://apache.fastbull.org/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz \
 | tar -xzC /opt/tomcat --strip-components=1 \
 && rm -Rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples

COPY file/tomcat7/tomcat-users.xml /opt/tomcat/conf/

# Expose tomcat
EXPOSE 8080

ENV JAVA_OPTS -server -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC \
  -Xms1G -Xmx2G -XX:PermSize=1G -XX:MaxPermSize=2G

WORKDIR /opt/tomcat
CMD ["bin/catalina.sh","run"]
