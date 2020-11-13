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
ENV REFRESHED_APP 2020-11-12

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
#local project source
#ADD ./app $IMAGE_APP_DIR
#remote project source
#ADD https://github.com/wangdamingll/docker_app.git /tmp

#build app
#remote project source
RUN cd /tmp && git clone https://github.com/wangdamingll/docker_app.git \
    && mkdir -p $IMAGE_APP_DIR && mv /tmp/docker_app/app/* $IMAGE_APP_DIR \
    && mkdir $IMAGE_APP_DIR/build && cd $IMAGE_APP_DIR/build && cmake .. && make install \
    && rm -rf $IMAGE_APP_DIR/build/* /tmp/docker_app

#local project source
#RUN ["/bin/bash", "-c", "cd $IMAGE_APP_DIR/build && cmake .. && make install && rm -rf $IMAGE_APP_DIR/build/*"]

#return workdir
WORKDIR $IMAGE_APP_BIN_DIR

#docker run cmd
ENTRYPOINT ["/bin/bash"]　
#CMD ["/bin/bash"]

