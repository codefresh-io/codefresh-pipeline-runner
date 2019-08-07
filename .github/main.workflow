workflow "pipeline runner" {
  on = "push"
  resolves = "run pipeline"
}

action "run pipeline" {
  uses = "./"
  env = {
    PIPELINE_NAME = "runp/runp"
  }
  secrets = ["CF_API_KEY"]
}
