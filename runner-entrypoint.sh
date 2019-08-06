#!/bin/sh

printenv

# parse branch
# in case of push event
BRANCH=$(cat /github/workflow/event.json | jq -r .ref | awk -F '/' '{print $3}')

if [-z "$BRANCH"]
then
	# in case of pullresuest event
	BRANCH=$(cat /github/workflow/event.json | jq -r head.ref)
fi

codefresh auth create-context mycontext --api-key $CF_API_KEY
codefresh auth use-contex mycontext

codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --sha=$GITHUB_SHA --branch=$BRANCH