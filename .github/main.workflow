workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./"
  secrets = ["CF_API_KEY"]
  env = {
    COMMIT_SHA = "16067146f79965ba4a58a7b2b182f8b0288ecded"
    BRANCH = "master"
    PIPELINE_NAME = "runp/runp"
    TRIGGER_NAME = "codefresh-io/codefresh-github-action-test"
  }
}
