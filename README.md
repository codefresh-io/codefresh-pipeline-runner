# Codefresh pipeline runner GitHub Action  

Codefresh is a CI/CD platform that engineers actually love to use. The [Codefresh pipeline](https://codefresh.io/docs/docs/configure-ci-cd-pipeline/pipelines/) runner GitHub action will trigger an existing Codefresh pipeline from a GitHub action.

It is based on the [Codefresh CLI](https://codefresh-io.github.io/cli/) which can execute Codefresh pipelines remotely (using an API key for authentication). The Codefresh CLI is already available as a [public Docker image](https://hub.docker.com/r/codefresh/cli/), so creating a GitHub action with it is a trivial process.

## Integrating Codefresh pipelines with GitHub actions

GitHub actions are a flexible way to respond to GitHub events and perform one or more tasks
when a specific GitHub event happens. GitHub actions can also use Codefresh pipelines as a back-end
resulting in a very powerful combination where the first action starts from GitHub, but Codefresh takes care
of the actual compilation or deployment in a pipeline.

<img src="/art/github-action-demo.gif?raw=true" width="600px">

## Prerequisites

Make sure that you have

* a GitHub account with Actions enabled
* a [Codefresh account](https://codefresh.io/docs/docs/getting-started/create-a-codefresh-account/) with one or more existing pipelines ready
* a [Codefresh API token](https://codefresh.io/docs/docs/integrations/codefresh-api/#authentication-instructions) that will be used as a secret in the GitHub action


## How the Codefresh action works

The GitHub workflow is placed on the [push event](https://developer.github.com/v3/activity/events/types/#pushevent) and therefore starts whenever a Git commit happens. The Workflow has a single action that starts the Codefresh pipeline runner.

The pipeline runner is a Docker image with the Codefresh CLI. It uses the Codefresh API token to authenticate to Codefresh and then calls a an existing pipeline via its trigger.

The result is that all the details from the Git push (i.e. the GIT hash) are transferred to the Codefresh pipeline that gets triggered remotely

## How to use the Codefresh GitHub action

An example of workflow

```
name: run codefresh pipeline
on: push
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout
        uses: actions/checkout@master
        
      - name: 'run pipeline'
        uses: codefresh-io/codefresh-pipeline-runner@v5
        with:
          args: '-v key1=value1 -v key2=value2'
        env:
          PIPELINE_NAME: 'codefresh-pipeline'
          TRIGGER_NAME: 'codefresh-trigger'
          CF_API_KEY: ${{ secrets.CF_API_KEY }}
        id: run-pipeline
```
### Env variables
* A secret with name `CF_API_KEY` and value your Codefresh API token ( https://codefresh.io/docs/docs/integrations/codefresh-api/#authentication-instructions )
* An environment variable called `PIPELINE_NAME` with a value of `<project_name>/<pipeline_name>`
* An optional environment variable called `TRIGGER_NAME` with trigger name attached to this pipeline. See the [triggers section](https://codefresh.io/docs/docs/configure-ci-cd-pipeline/triggers/) for more information
* An optional environment variable called `CF_BRANCH` with branch name .

Click the Done button to save your changes and commit.

Now next time you commit anything in your GitHub repository the Codefresh pipeline will also execute.

### Outputs
The action will report if the pipeline execution was successful. For example, if your pipeline has unit tests that fail, by default, it will report the action failed. The logs from the pipeline will be streamed into the Github action console.

