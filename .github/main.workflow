workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  secrets = ["CF_API_KEY"]
  env = {
    TRIGGER_NAME = "codefresh-trigger"
    PIPELINE_NAME = "codefresh-pipeline"
  }
}
