# Scorecard Tool
## Running scorecard_tool with development server

* Pull TC Informix image
```
docker pull appiriodevops/informix:cbbd0fa
```

* Run the Informix server
```
docker run --name tc-informix -p 2021:2021 -it appiriodevops/informix:cbbd0fa
```

* Pull Grails image. Version 1.3 is used
```
docker pull onesysadmin/grails:1.3
```

* Edit file ```env.list``` to meet with your environment
* Run the app
```
cd <extracted_scorecard_tool>
docker run --env-file ./env.list -i -t -p 8080:8080 --rm -v $PWD:/app onesysadmin/grails:1.3 grails run-app
```

## Build and running scorecard tool with standalone tomcat instance
* Create war
```
cd <extracted_scorecard_tool>
docker run --rm -ti -v $PWD:/app onesysadmin/grails:1.3 grails war scorecard.war
```

* Build tomcat container with scorecare tool app (If you haven't)
```
docker build -t <tomcat_container_tag> -f docker/tomcat/Dockerfile .
```

* Run tomcat
```
docker run -ti --rm --env-file ./env.list -p 8080:8080 <tomcat_container_tag>
```

Note. You can override default tomcat start up command ```catalina.sh run``` by adding command
after it.

#
## Verification
Open browser, go to http://<docker_ip>:8080/scorecard

Install the `cookie inspector` extension to the browser. (I'm using Chrome for testing). 
Add the cookie `tcsso_vm=132456|4a6acc4d5327773989a7e8c23b4e8cd1c3da79a125659973ed731ffaf24a2` as this screenshot: http://take.ms/PUSNt

The result is like: http://take.ms/w5CZ2
