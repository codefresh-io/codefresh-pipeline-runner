#!/bin/sh

echo ------------------
echo $GITHUB_SHA


codefresh auth create-context mycontext --api-key $CF_API_KEY
codefresh auth use-contex mycontext

codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --sha=$GITHUB_SHA --branch=$BRANCH

echo =======================

