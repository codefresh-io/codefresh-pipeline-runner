workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./codefresh-github-action"
  args = ["test action1", "test action 2"]
  secrets = ["GITHUB_TOKEN"]
}
