#base image
FROM wangdamingll/ubuntu:ubuntu_env

#author info
MAINTAINER wangdamingll "wangdamingll@163.com"

#env set
ENV APPLICATION_NAME testapp
ENV ENVIRONMENT development

#label set
LABEL Version="0.0.1" 

#add files to image
#ADD software.lic /opt/application/software.lic
#if you are in china,do follow below,otherwise,not do it
#RUN ["cp", "/etc/apt/sources.list", "/etc/apt/sources.list_bak"]
#ADD sources.list /etc/apt/ 

#flush apt cache
#ENV REFRESHED_AT 2020-11-11
#RUN ["apt-get", "update"] 　

#flush app cache
ENV REFRESHED_APP 2020-11-11

#build args 
#ARG build
#ARG webapp_user=user

#set running container workdir
#WORKDIR /opt/test

#use what for running container
#USER root

#add image volume
#VOLUME ["/opt/project", "/data"]

#copy files to image
#COPY conf.d/ /etc/apache2/

#send signal for stoping container
#STOPSIGNAL

#use this image trigger
#ONBUILD ADD ../app/ /

#-------------------------------
#follow is test app set
#set app dir env 
ENV IMAGE_APP_DIR /data/app
ENV IMAGE_APP_BIN_DIR /data/publish

#add app to image
ADD ./app $IMAGE_APP_DIR

#build app
WORKDIR $IMAGE_APP_DIR
RUN cmake . && make install
RUN rm -rf *install* CMakeCache.txt CMakeFiles Makefile
WORKDIR $IMAGE_APP_DIR/src
RUN rm -rf *install* CMakeCache.txt CMakeFiles Makefile $APPLICATION_NAME
#RUN ["rm","-rf","cmake_install.cmake","install_manifest.txt","Makefile","CMakeCache.txt","CMakeFiles"]

#return workdir
WORKDIR $IMAGE_APP_BIN_DIR

#docker run cmd
ENTRYPOINT ["/bin/bash"]　
#CMD ["/bin/bash"]

