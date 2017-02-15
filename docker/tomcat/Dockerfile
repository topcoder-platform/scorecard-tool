FROM tomcat:6

ENV CATALINA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms512m -Xmx1300m -XX:PermSize=256m -XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC

RUN ln -s /usr/local/tomcat /tomcat

ADD docker/tomcat/server.xml /tomcat
ADD docker/tomcat/start.sh /tomcat/bin
ADD scorecard.war /tomcat/webapps

EXPOSE 8080
WORKDIR /tomcat/bin

ENTRYPOINT ["start.sh"]
CMD ["catalina.sh", "run"]
