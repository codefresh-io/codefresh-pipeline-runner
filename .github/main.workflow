workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./"
  secrets = ["GITHUB_TOKEN", "CF_API_KEY", "PIPELINE_NAME"]
}
