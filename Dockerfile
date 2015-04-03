FROM centos:latest

ADD es.repo /etc/yum.repos.d/es.repo
RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
RUN yum update -y && yum install java-headless elasticsearch nano -y --nogpgcheck
RUN yum clean metadata
RUN yum clean all
RUN mkdir /data
RUN mkdir /data/es && mkdir /data/conf
RUN chown -Rv elasticsearch:elasticsearch /data/es
RUN chown -Rv elasticsearch:elasticsearch /data/conf
ADD elasticsearch.yml /data/conf/elasticsearch.yml
ADD logging.yml /data/conf/logging.yml

VOLUME ["/data/"]
EXPOSE 9200
