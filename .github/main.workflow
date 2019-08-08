workflow "test" {
  on = "push"
  resolves = ["demo"]
}
action "demo" {
  needs = "ACTION1"
  uses = "docker://alpine"
  runs = ["sh", "-c", "echo $GITHUB_SHA"] 
}
