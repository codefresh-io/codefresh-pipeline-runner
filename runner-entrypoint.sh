#!/bin/sh

# parse branch
# in case of push event
BRANCH=$(cat $GITHUB_EVENT_PATH | jq -r .ref | awk -F '/' '{print $3}')

if [-z "$BRANCH"]
then
	# in case of pullresuest event
	BRANCH=$(cat $GITHUB_EVENT_PATH | jq -r head.ref)
fi

codefresh auth create-context context --api-key $CF_API_KEY
codefresh auth use-contex context

codefresh run $PIPELINE_NAME --trigger=$TRIGGER_NAME --branch=$BRANCH
