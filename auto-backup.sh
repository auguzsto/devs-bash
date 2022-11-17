
#!/bin/bash

pathBackup="/backup-glpi/";
pathRoot="/var/www/html/glpi";
d=$(date +%d-%m-%Y);
sudo rm -r -v /var/www/html/glpi/files/_sessions
mkdir /var/www/html/glpi/files/_sessions
sudo chmod 777 -R /var/www/html/glpi/files/_sessions
cp -r -R $pathRoot/files $pathBackup
cp -r -R $pathRoot/config $pathBackup
cp -r -R $pathRoot/marketplace $pathBackup
cp -r -R $pathRoot/plugins $pathBackup
mysqldump glpi > /backup-glpi/glpi-$d.sql
zip -r -1 glpi-$d.zip /backup-glpi/
sudo mv glpi-$d.zip /mnt/backup-glpi/glpi-$d.zip
sudo rm -r /backup-glpi/*
