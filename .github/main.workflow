workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    PIPELINE_NAME = "codefresh-pipeline"
    SKIP_TRIGGER_NAME = "codefresh-trigger"
  }
  secrets = ["CF_API_KEY"]
}
