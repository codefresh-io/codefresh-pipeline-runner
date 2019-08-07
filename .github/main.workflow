workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    PIPELINE_NAME = "codefresh-pipeline"
    TRIGGER_NAME = "codefresh-trigger"
  }
  secrets = ["CF_API_KEY"]
}
