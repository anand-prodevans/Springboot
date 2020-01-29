#!/bin/bash
TAG_NAME=$1
APPLICATION_NAME=$2
test -e images_tag.sh
 if [ $? -eq 0 ]; then rm -rf images_tag.sh  && echo 'Old Script removed'; fi
cat >> images_tag.sh << __EOF__
oc patch deploymentconfig/${APPLICATION_NAME} -p '{"spec": { "triggers":[ {"type": "ConfigChange", "type": "ImageChange" , "imageChangeParams": {"automatic": true, "containerNames":["${APPLICATION_NAME}"],"from": {"name":"${APPLICATION_NAME}:${TAG_NAME}"}}}]}}'
__EOF__
sh images_tag.sh 
