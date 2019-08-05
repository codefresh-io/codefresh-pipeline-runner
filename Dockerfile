FROM debian:9.5-slim

LABEL "com.github.actions.name"="test-pipeline-runner"
LABEL "com.github.actions.description"="allow run custom codefresh pipeline"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/codefresh-io/codefresh-github-action-test"
LABEL "homepage"="https://github.com/codefresh-io/codefresh-github-action-test"
LABEL "maintainer"="Octocat <denys@codefresh.io>"

ADD entrypoint.sh /entrypoint.sh
CMD chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]