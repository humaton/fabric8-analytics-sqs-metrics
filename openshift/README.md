# Deploying worker scaler

First make sure you're logged in to the right cluster and on the right project:

```
$ oc project
```

Note this guide assumes that secrets and config maps have already been deployed.

## Configrue worker scaler

Environment variables are used to configure the scaler

```
$WORKER_POD_TO_SCALE
$SQS_QUEUE_FOR_SCALING
$DEFAULT_NUMBER_OF_PODS
$MAX_NUMBER_OF_PODS
```


To deploy worker scaler simply run

```
./deploy.sh
```