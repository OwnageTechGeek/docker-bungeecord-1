docker #!/bin/bash

echo "eula=true" > /$WATERFALL_HOME/eula.txt
chown -R waterfall.waterfall /$WATERFALL_HOME/


cd /$WATERFALL_HOME/
su - waterfall -c 'java -Xms128M -Xmx256M -XX:MaxPermSize=128M -jar Waterfall.jar'

bash
