# Version 0.0.4
FROM ubuntu
MAINTAINER Berti Golf <info@berti-golf.de>
RUN apt-get update
RUN sudo apt-get install -y lamp-server^
RUN apt-get install -y joe git curl
RUN  echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf && sudo a2enconf fqdn

# Add image configuration and scripts
run echo 'add files'
ADD apache2-start.sh /apache2-start.sh
ADD mysqld-start.sh /mysqld-start.sh

RUN chmod 755 /*.sh

EXPOSE 80 
RUN echo 'start server' neu
CMD ["/apache2-start.sh"]
