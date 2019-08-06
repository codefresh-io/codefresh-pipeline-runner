#!/bin/sh

echo ------------------

ls

echo 111111111111

cd pwd

echo 22222

cd .. && pwd && ls

echo 333333333333

cd / pwd && ls





#codefresh auth create-context mycontext --api-key $CF_API_KEY
#codefresh auth use-contex mycontext

#cd $GITHUB_EVENT_PATH
#cat ../workspace/event.json

#codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --sha=$GITHUB_SHA --branch=$BRANCH

echo =======================
