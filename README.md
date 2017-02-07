# Scorecard Tool
## Steps to run scorecard_tool as standalone app

* Pull TC Informix image
```
docker pull appiriodevops/informix:cbbd0fa
```

* Run the Informix server
```
docker run --name tc-informix -p 2021:2021 -it appiriodevops/informix:6f3884d
```

* Pull Grails image. Version 1.3 is used
```
docker pull onesysadmin/grails:1.3
```

Current scorecard_tool is still on 1.3.7 version while onesysadmin/grails:1.3 is a 1.3.9 version.
We need to upgrade it first.

```
docker run --link tc-informix -i -t -p 8080:8080 --rm -v <extracted_scorecard_tool>:/app onesysadmin/grails:1.3 grails upgrade
```

Select `Y` to upgrade

Replace <extracted_scorecard_tool> with actual path where scorecard_tool from submission archive is extracted to.
We can also use $PWD if we execute the command from extracted scorecard_tool directory itself.

* Clean the grails app
```
docker run --link tc-informix -i -t -p 8080:8080 --rm -v <extracted_scorecard_tool>:/app onesysadmin/grails:1.3 grails clean
```

* Compile the app
```
docker run --link tc-informix -i -t -p 8080:8080 --rm -v <extracted_scorecard_tool>:/app onesysadmin/grails:1.3 grails compile -–refresh-dependencies
```

* Run the app
```
docker run --link tc-informix -i -t -p 8080:8080 --rm -v <extracted_scorecard_tool>:/app onesysadmin/grails:1.3 grails run-app
```

## Verification
Open browser, go to http://<docker_ip>:8080/scorecard

