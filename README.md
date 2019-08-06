# Integrating Codefresh pipelines with Github actions

Github actions are a flexible way to respond to Github events and perform one or more tasks
when a specific Github event happens. Github actions can also use Codefresh pipeline as a back-end
resulting in a very powerful combination where the first action starts from Github, but Codefresh takes care
of the actual compilation or deployment in a pipeline.


## Codefresh Github action

This repository holds a Github action that can be used to call existing [Codefresh pipelines](https://codefresh.io/docs/docs/configure-ci-cd-pipeline/pipelines/). It is based on the [Codefresh CLI](https://codefresh-io.github.io/cli/) which can execute Codefresh pipelines remotely (using an API key for authentication). The Codefresh CLI is already available as a [public Docker image](https://hub.docker.com/r/codefresh/cli/), so creating a Github action with it is a trivial process.

## Prerequisites

Make sure that you have

* a Github account with Actions enabled
* a [Codefresh account](https://codefresh.io/docs/docs/getting-started/create-a-codefresh-account/) with one or more existing pipelines ready
* a [Codefresh API token](https://codefresh.io/docs/docs/integrations/codefresh-api/#authentication-instructions) that will be used as a secret in the Github action


## How the Codefresh action works

The Github workflow is placed on the [push event](https://developer.github.com/v3/activity/events/types/#pushevent) and therefore starts whenever a Git commit happens. The Workflow has a single action that starts the Codefresh pipeline runner.

The pipeline runner is a Docker image with the Codefresh CLI. It uses the Codefresh API token to authenticate to Codefresh and then calls a an existing pipeline via its trigger.

The result is that all the details from the Git push (i.e. the GIT hash) are transferred to the Codefresh pipeline that gets triggered remotely

## How to use the Codefresh Github action

In order to use the Github action, fork this repository and then navigate to the "Actions" tab in Github. Click on the "View main.workflow" button on the right hand side. Make sure that an actual branch is selected on the top left of the window. Then click the "Edit this file" button in the main workarea (exactly as you would edit a normal git file via Github)

Select the pipeline runner action and click the "Edit" button. On the right side panel enter the following

* A secret with name `CF_API_KEY` and value your Codefresh API token
* An environment variable called `PIPELINE_NAME` with a value of `<project_name>/<pipeline_name>`
* An environment variable called `TRIGGER_NAME` with trigger name attached to this pipeline. See the [triggers section](https://codefresh.io/docs/docs/configure-ci-cd-pipeline/triggers/) for more information

Click the Done button to save your changes and commit.

Now next time you commit anything in your Github repository the Codefresh pipeline will also execute.

## Usage
An example to run codefresh pipeline that can compile, test , docker build and deploy to kubernetes
```
name: 'Codefresh pipeline runner'
description: 'Github action that run codefresh pipeline'
author: 'codefresh'
branding:
  icon: 'arrow-right-circle'
  color: 'green'
runs:
  using: 'docker'
  image: 'Dockerfile'
``` 
