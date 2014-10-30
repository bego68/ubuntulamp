# Version 0.0.2
FROM ubuntu
MAINTAINER Berti Golf <info@berti-golf.de>
RUN apt-get update
RUN sudo apt-get install -y lamp-server^
RUN apt-get install -y joe
RUN  echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf && sudo a2enconf fqdn
RUN service apache2 start
RUN service mysql start
RUN echo 'hi Andy und Berti'
