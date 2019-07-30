FROM ubuntu:18.04
MAINTAINER harikrishnanrajeev@gmail.com
#update packages
RUN apt-get -y update
#php asks for timezone hence install beforehand
RUN apt-get -y install tzdata
ENV TZ=Europe/Minsk
ADD config /opt
#organizing packages names into config files
RUN apt-get -y install `cat /opt/nginxphp`
#
RUN apt-get -y install `cat /opt/phpgenericmod`
#Project specific
RUN apt-get -y install `cat /opt/phpprojmod`
#/var/www/html is the docment root
ADD code /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
#this will have 5 image layers + 11 image layers , 5 layers for first command "FROM" ie UBUNTU 
#docker history gives details of the layers
#docker history harikrishnanrajeev/mynginx:1.0