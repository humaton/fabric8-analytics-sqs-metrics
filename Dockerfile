FROM registry.centos.org/centos/centos:7
MAINTAINER Tomas Hrcka <thrcka@redhat.com>

RUN yum --setopt=tsflags=nodocs install -y epel-release && \
    yum --setopt=tsflags=nodocs install -y python34-pip wget python34-devel libxml2-devel libxslt-devel python34-requests python34-pycurl && \
    yum clean all

RUN pip3 install --upgrade pip && pip install --upgrade wheel && \
    pip3 install boto3 flask
RUN mkdir -p /home/sqs-stats

COPY app.py /home/sqs-stats

WORKDIR /home/sqs-stats

ENV LANG=en_US.UTF-8

ENV FLASK_APP=app.py

#RUN flask run
