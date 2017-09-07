#!/usr/bin/bash -e

OC_VERSION="openshift-origin-client-tools-v3.6.0-c4dd4cf-linux-64bit"
OC_URL="https://github.com/openshift/origin/releases/download/v3.6.0/${OC_VERSION}.tar.gz"
OC_TGZ_FILENAME="oc.tar.gz"

curl -L $OC_URL -o $OC_TGZ_FILENAME
tar -xvzf $OC_TGZ_FILENAME
mv "${OC_VERSION}/oc" /usr/bin/

rm -f $OC_TGZ_FILENAME
rm -rf "${OC_VERSION:?}/"
