chown -R waterfall /$PROCESSHOME/


cd /$PROCESSHOME/
su - waterfall -c 'java -Xms64M -Xmx768M -XX:MaxPermSize=128M -DIReallyKnowWhatIAmDoingThisUpdate=true -jar Waterfall.jar'

bash
