#!/usr/bin/bash -e

set -x
oc whoami
oc project
set +x

function scale_up { 
    oc scale -n $PROJECT --replicas=2 rc $POD_TO_SCALE
    }

function scale_down { 
    echo $1 
    }
function scale_to_default { 
    echo $1 
    }
