######### PREPARETION ##########

mvn clean install -q  # To generate jar file in target folder


######### APPIUM SESSION ##########

# Start Appium session
# --relaxed-security --> enable security access
# --session-override --> overwrite the session
# --log-level error --> remove debug meesage in console
# --port 4723 --> port definition
# --command-timeout 120 --> waiting period
# & --> allows appium to run in background

appium --relaxed-security --log-level error --session-override --port $APPIUM_SYSTEM_PORT &
sleep 10
echo "Appium has started"


######### EXECUTION ##########

java -jar target/file.jar \
--plugin pretty \
--plugin json:target/cucumber-reports/cucumber.json \
--plugin html:target/cucumber-reports \
--plugin rerun:target/rerun.txt \
--glue path/to/steps_definition \
--monochrome \
--tags "@feature1,@feature2,......" \
--tags ~@ignoredTags path/to/features


######### TERMINATE CHILD PROCESSES ##########
kill $(ps -ef | grep "appium")