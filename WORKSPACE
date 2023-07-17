
workspace(name = 'SharedMono')
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

http_archive(
    name = "rules_swift_package_manager",
    sha256 = "e26967e8f76a654b4b15c05d8d6af30dfa4bd463bc7731ec180cd19bddc6273d",
    urls = [
        "https://github.com/cgrindel/rules_swift_package_manager/releases/download/v0.4.2/rules_swift_package_manager.v0.4.2.tar.gz",
    ],
)

# MARK: - Xcodeproj
http_archive(
    name = "rules_xcodeproj",
    sha256 = "f836d2a516a911dc0ace44b1f51aa575613f149a934f4be1e7bd551a549672ff",
    url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/1.7.1/release.tar.gz",
)

load(
    "@rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

## Apple rules
git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    #commit = "915ac30a9fa1fd3809599a5ab90fa1c6640fe8dc", # it is the commit of tag 2.3.0, you can delete this and use the below "tag"
    tag = "2.3.0", #remain at 2.3.0, when change it to 2.4.0 or 2.4.1, it will report errors when execute the command line "bazel build //SampleApp:SampleApp" 
)



# MARK: - Swift Toolchain

load(
    "@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies",
)
apple_rules_dependencies()

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "b3b6c5c9f2a589150f71e79dec1e1ed0eb974dbd49e9317df4e09e08ff6e83df",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.9.1/rules_swift.1.9.1.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)


swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)
swift_rules_extra_dependencies()