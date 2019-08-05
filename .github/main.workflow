workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./codefresh-github-action"
  args = ["arg1", "arg2"]
}
