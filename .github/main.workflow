workflow "test-runner" {
  on = "push"
  resolves = ["test-pipeline-runner"]
}

action "test-pipeline-runner" {
  uses = "./"
   env = {
      PIPELINE_NAME = "gitlab/gitlab",
      CF_API_KEY = "5d4959b0425e20bf9068ea7b.3a4ebde227b81fa2fbb04b7ab5a39ca1"
   }
}
