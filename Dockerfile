# Version 0.0.3
FROM ubuntu
MAINTAINER Berti Golf <info@berti-golf.de>
RUN apt-get update
RUN sudo apt-get install -y lamp-server^
RUN apt-get install -y joe git curl
RUN  echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf && sudo a2enconf fqdn

# Add image configuration and scripts
ADD apache2-start.sh /start-apache2.sh
ADD mysqld-start.sh /start-mysqld.sh

RUN chmod 755 /*.sh

EXPOSE 80 
RUN echo 'start server'
CMD ["/apache2-start"]
CMD ["/mysqld-start"]
run echo 'started'