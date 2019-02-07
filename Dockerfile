FROM tomcat:latest


COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
ADD ./gameoflife-web/target/*.war /usr/local/tomcat/webapps/
