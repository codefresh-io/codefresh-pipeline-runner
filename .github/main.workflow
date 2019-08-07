workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    PIPELINE_NAME = "runp/runp"
    TRIGGER_NAME = "codefresh-io/codefresh-github-action-test"
  }
  secrets = ["CF_API_KEY"]
}
