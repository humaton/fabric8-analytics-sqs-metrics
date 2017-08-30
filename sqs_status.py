#!/usr/bin/python

import sys, getopt, os
import boto3

conn_args = {
    'aws_access_key_id': os.getenv('AWS_SQS_ACCESS_KEY_ID'),
    'aws_secret_access_key': os.getenv('AWS_SQS_SECRET_ACCESS_KEY'),
    'region_name': 'us-east-1'
}
sqs = boto3.resource('sqs',**conn_args)
queue = None

def main(argv):
   sqs_queue_name = ''
   try:
      opts, args = getopt.getopt(argv,"hq:",["queue="])
   except getopt.GetoptError:
      print 'test.py -q <queue_name>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'test.py -q <queue_name>'
         sys.exit()
      elif opt in ("-q", "--queue"):
         sqs_queue_name = arg
         queue = sqs.get_queue_by_name(QueueName=sqs_queue_name)
         result = queue.attributes.get('ApproximateNumberOfMessages')
         print result

if __name__ == "__main__":
   main(sys.argv[1:])
