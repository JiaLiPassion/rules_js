"npm_package_internal rule"

load("@bazel_skylib//lib:dicts.bzl", "dicts")
load(":npm_package.bzl", _npm_package_lib = "npm_package_lib")

_INTERNAL_ATTRS = dicts.add(_npm_package_lib.attrs, {
    "src": attr.label(
        doc = "A source directory or output directory to use for this package. For specifying a list of files, use `srcs` instead.",
        allow_single_file = True,
        mandatory = True,
    ),
})

npm_package_internal = rule(
    implementation = _npm_package_lib.implementation,
    attrs = _INTERNAL_ATTRS,
    provides = _npm_package_lib.provides,
)
