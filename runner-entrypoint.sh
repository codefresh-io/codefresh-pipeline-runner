#!/bin/sh

echo ------------------

#codefresh auth create-context mycontext --api-key $CF_API_KEY
#codefresh auth use-contex mycontext

cd $GITHUB_EVENT_PATH
ls
echo cat event.json

#codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --sha=$GITHUB_SHA --branch=$BRANCH

echo =======================

