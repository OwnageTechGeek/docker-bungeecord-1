docker #!/bin/bash

echo "eula=true" > /$WATERFALL_HOME/eula.txt
chown -R waterfall.waterfall /$WATERFALL_HOME/


cd /$WATERFALL_HOME/
su - waterfall -c 'java -Xms64M -Xmx768M -XX:MaxPermSize=128M -DIReallyKnowWhatIAmDoingThisUpdate=true -jar Waterfall.jar'

bash
