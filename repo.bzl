
def _source_repo_impl(repository_ctx):
    repository_ctx.file("private.txt", "TEST")
    repository_ctx.file("BUILD.bazel")

def _violating_repo_impl(repository_ctx):
    full_dep_path = repository_ctx.path(repository_ctx.attr.dep)
    # Whoops
    repository_ctx.execute(["rm", full_dep_path])
    repository_ctx.file("BUILD.bazel")

source_repo = repository_rule(
    implementation = _source_repo_impl,
)

violating_repo = repository_rule(
    implementation = _violating_repo_impl,
    attrs = {
        "dep": attr.label(),
    },
)
