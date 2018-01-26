chown -R process /$PROCESSHOME/
cd /$PROCESSHOME/
su - process -c 'java -Xms64M -Xmx768M -XX:MaxPermSize=128M -DIReallyKnowWhatIAmDoingThisUpdate=true -jar Waterfall.jar'

bash
