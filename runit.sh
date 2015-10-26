#!/bin/bash -xe

for dir in `ls /var/www/html/` ; do
  sed 's/@@DIR@@/'$dir'/g;s#@@PASSWD_FILE@@#'$PASSWD_FILE'#g' /templates/repo-template.conf > /etc/apache2/sites-available/git-$dir.conf
  a2ensite git-$dir
done
exec apache2-foreground
