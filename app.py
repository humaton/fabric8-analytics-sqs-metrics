from flask import Flask
from flask import jsonify
import boto3


app = Flask(__name__)
sqs = boto3.resource('sqs')
queue = None

@app.route('/')
def hello_world():
    queue = sqs.get_queue_by_name(QueueName='STAGE_livenessFlow_v0')
    return queue.attributes.get('ApproximateNumberOfMessages')

@app.route('/queue/<queuename>')
def show_user_profile(queuename):
    queue = sqs.get_queue_by_name(QueueName=queuename)
    result = queue.attributes.get('ApproximateNumberOfMessages')
    return jsonify(QueueName=queuename,
                   NumberOfMessages=result,
                   QueueUrl=queue.url)

