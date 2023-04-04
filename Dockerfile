FROM ubuntu:bionic

MAINTAINER B.K.Jayasundera

# Update base packages
RUN apt update && \
    apt upgrade --assume-yes

ARG DEBIAN_FRONTEND=noninteractive
RUN export SUDU_FORCE_REMOVE=yes
RUN apt install -y software-properties-common 

RUN apt install -y policykit-1

RUN add-apt-repository ppa:iconnor/zoneminder-master && \
    apt -y install gnupg msmtp tzdata supervisor && \ 
    apt -y -f install zoneminder && \
   /etc/init.d/mysql start

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# COPY zm_create.sql /usr/share/zoneminder/db/zm_create.sql
 

RUN chmod 740 /etc/zm/zm.conf && \
    chown root:www-data /etc/zm/zm.conf && \
    adduser www-data video && \
    a2enmod cgi && \
    a2enconf zoneminder && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod expires && \
    ln -s /usr/bin/msmtp /usr/sbin/sendmail && \
    sed -i "228i ServerName localhost" /etc/apache2/apache2.conf && \
    /etc/init.d/apache2 start

# Expose http port
EXPOSE 80

COPY startzm.sh /usr/bin/startzm.sh
COPY firstrun.sh /usr/bin/firstrun.sh
COPY updatemysql.sh /usr/bin/updatemysql.sh
RUN chmod 777 /usr/bin/startzm.sh
RUN chmod 777 /usr/bin/firstrun.sh
RUN chmod 777 /usr/bin/updatemysql.sh
CMD ["/usr/bin/supervisord"]
