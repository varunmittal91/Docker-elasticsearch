FROM centos:latest

ADD es.repo /etc/yum.repos.d/es.repo
RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch
RUN yum update -y && yum install java-headless elasticsearch nano initscripts -y --nogpgcheck
RUN yum clean metadata
RUN yum clean all
ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
ADD start.sh /bin/start.sh

VOLUME ["/data/es/"]
VOLUME ["/data/log/"]

EXPOSE 9200

ENTRYPOINT ["/bin/bash"]
