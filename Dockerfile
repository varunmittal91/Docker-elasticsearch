FROM centos:latest

ADD es.repo /etc/yum.repos.d/es.repo
RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
RUN yum update -y && yum install java-headless elasticsearch nano initscripts -y --nogpgcheck
RUN yum clean metadata
RUN yum clean all
RUN mkdir /data
RUN mkdir /data/es && mkdir /data/log
RUN chown -Rv elasticsearch:elasticsearch /data/es
RUN chown -Rv elasticsearch:elasticsearch /data/log
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

VOLUME ["/data/"]
EXPOSE 9200

ENTRYPOINT ["/bin/bash"]
