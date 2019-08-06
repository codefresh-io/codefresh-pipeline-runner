workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./"
  secrets = ["GITHUB_TOKEN", "CF_API_KEY", "PIPELINE_NAME"]
  env = {
    TRIGGER_NAME = "denys-codefresh/test"
    COMMIT_SHA = "16067146f79965ba4a58a7b2b182f8b0288ecded"
    BRANCH = "master"
  }
}
