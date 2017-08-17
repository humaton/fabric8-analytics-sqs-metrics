import os
from flask import Flask
from flask import jsonify
import boto3

conn_args = {
    'aws_access_key_id': os.getenv('AWS_SQS_ACCESS_KEY_ID'),
    'aws_secret_access_key': os.getenv('AWS_SQS_SECRET_ACCESS_KEY'),
    'region_name': 'us-east-1'
}

app = Flask(__name__)
sqs = boto3.resource('sqs',**conn_args)
queue = None

@app.route('/')
def hello_world():
    return 'Ola!'

@app.route('/queue/<queuename>')
def show_user_profile(queuename):
    queue = sqs.get_queue_by_name(QueueName=queuename)
    result = queue.attributes.get('ApproximateNumberOfMessages')
    return jsonify(QueueName=queuename,
                   NumberOfMessages=result,
                   QueueUrl=queue.url)

