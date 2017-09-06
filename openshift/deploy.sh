#!/usr/bin/bash -e

set -x
oc whoami
oc project
set +x

WORKER_POD_TO_SCALE="bayesian-worker-ingestion"
SQS_QUEUE_FOR_SCALING="stage_ingestion_bayesianAnalysisFlow_v0"

DEFAULT_NUMBER_OF_PODS=5
MAX_NUMBER_OF_PODS=10


function oc_process_apply() {
  echo -e "\n Processing template - $1 ($2) \n"
  oc process -f $1 $2 | oc apply -f -
}

here=`dirname $0`
template="${here}/template.yaml"

oc_process_apply "$template" "-p WORKER_POD_TO_SCALE=${WORKER_POD_TO_SCALE} -p ${SQS_QUEUE_FOR_SCALING} -p ${DEFAULT_NUMBER_OF_PODS} -p ${MAX_NUMBER_OF_PODS}"
