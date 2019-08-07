workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    TRIGGER_NAME = "codefresh-trigger"
    PIPELINE_NAME_SKIPED = "codefresh-pipeline"
  }
  secrets = ["CF_API_KEY"]
}
