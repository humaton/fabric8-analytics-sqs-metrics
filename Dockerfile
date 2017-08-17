FROM registry.centos.org/centos/centos:7
MAINTAINER Tomas Hrcka <thrcka@redhat.com>
RUN pip3 install --upgrade pip && pip install --upgrade wheel && \
    pip3 install boto3 flask
RUN mkdir -p ${HOME}/sqs-stats
COPY app.py ${HOME}/sqs-stats
RUN cd ${HOME}/sqs-stats
RUN export FLASK_APP=app.py
RUN flask run