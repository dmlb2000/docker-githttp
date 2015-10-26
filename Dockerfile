from php:5.5-apache

run apt-get -y update && \
    apt-get -y install git && \
    apt-get -y clean all
run a2enmod dav_fs
run a2enmod dav
run mkdir -p /templates
copy runit.sh /usr/sbin/runit.sh
copy repo-template.conf /templates/
run chmod a+x /usr/sbin/runit.sh
env PASSWD_FILE /etc/apache2/passwd.git
volume /var/www/html
cmd /usr/sbin/runit.sh
