workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    PIPELINE_NAME = "codefresh-pipeline"
  }
  secrets = ["CF_API_KEY"]
}
