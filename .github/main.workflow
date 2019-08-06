workflow "Apply PR labels" {
  on = "push"
  resolves = "Apply labels"
}

action "On sync" {
  uses = "actions/bin/filter@master"
  args = "action synchronize"
}

action "Apply labels" {
  uses = "actions/labeller@v1.0.0"
  needs = "On sync"
  env = {
    LABEL_SPEC_FILE = ".github/triage.yml"
  }
  secrets = [
    "GITHUB_TOKEN",
    "PIPELINE_NAME",
    "CF_API_KEY",
  ]
}
