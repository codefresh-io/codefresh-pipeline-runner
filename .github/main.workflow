workflow "test" {
  on = "push"
  resolves = ["demo"]
}
action "demo" {
  uses = "docker://alpine"
  runs = ["sh", "-c", "echo $GITHUB_SHA"] 
}
