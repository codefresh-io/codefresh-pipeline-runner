#!/bin/sh

echo ------------------

printenv

codefresh auth create-context mycontext --api-key $CF_API_KEY
codefresh auth use-contex mycontext

codefresh run $PIPELINE_NAME

ehco =======================
