
load("//:repo.bzl", "source_repo", "violating_repo")

source_repo(
    name = "source_repo",
)

violating_repo(
    name = "violating_repo",
    dep = "@source_repo//:private.txt",
)
