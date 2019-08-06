workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./"
  secrets = ["CF_API_KEY"]
  env = {
    PIPELINE_NAME = "runp/runp"
    TRIGGER_NAME = "codefresh-io/codefresh-github-action-test"
  }
}
