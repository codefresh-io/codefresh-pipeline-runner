#!/bin/sh

# parse branch
# in case of push event
BRANCH=$(cat $GITHUB_EVENT_PATH | jq -r .ref | awk -F '/' '{print $3}')

if [-z "$BRANCH"]
then
	# in case of pullresuest event
	BRANCH=$(cat $GITHUB_EVENT_PATH | jq -r head.ref)
fi

codefresh auth create-context mycontext --api-key $CF_API_KEY
codefresh auth use-contex mycontext

codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --sha=$GITHUB_SHA --branch=$BRANCH