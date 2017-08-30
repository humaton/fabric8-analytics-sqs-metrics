FROM registry.centos.org/centos/centos:7
MAINTAINER Tomas Hrcka <thrcka@redhat.com>

RUN yum --setopt=tsflags=nodocs install -y epel-release && \
    yum --setopt=tsflags=nodocs install -y python34-pip wget python34-devel libxml2-devel libxslt-devel python34-requests python34-pycurl origin-clients && \
    yum clean all

RUN pip3 install --upgrade pip && pip install --upgrade wheel && \
    pip3 install boto3 
RUN mkdir -p /home/sqs-stats

COPY scale.sh /home/sqs-stats
COPY sqs_status.py /home/sqs-stats

WORKDIR /home/sqs-stats

ENV LANG=en_US.UTF-8
