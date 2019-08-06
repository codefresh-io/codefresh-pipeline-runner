FROM codefresh/cli

LABEL "com.github.actions.name"="codefresh-pipeline-runner"
LABEL "com.github.actions.description"="allows to run custom codefresh pipelines"
LABEL "com.github.actions.icon"="play-circle"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/codefresh-io/codefresh-pipeline-runner"
LABEL "homepage"="https://github.com/codefresh-io/codefresh-pipeline-runner"
LABEL "maintainer"="<denys@codefresh.io>"

ADD runner-entrypoint.sh /runner-entrypoint.sh

ENTRYPOINT ["/runner-entrypoint.sh"]