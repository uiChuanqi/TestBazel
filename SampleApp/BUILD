load("@rules_xcodeproj//xcodeproj:defs.bzl","top_level_target","xcodeproj",)
load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")


objc_library(
    name = "TestOCClass",
    module_name = "TestOCClass",
    srcs = [
         "OCClasses/TestOCClass/TestOCClass.m",
    ],
    hdrs = glob(["OCClasses/TestOCClass/*.h"]),
)

swift_library(
    name = "SampleAppLibrary",
    srcs = glob(["*.swift"]) ,
    deps = [
        ":TestOCClass",
    ],
    copts = [
        "-import-objc-header",
        "$(location :OCClasses/BridgeHeader.h)",
    ],
    swiftc_inputs = [":OCClasses/BridgeHeader.h"],
    data = glob(["OCClasses/*.h"]) ,
    visibility = ["//visibility:public"],
)

xcodeproj(
    name = "xcodeproj",
    build_mode = "bazel",
    project_name = "SampleApp",
    tags = ["manual"],
    config = "rules_xcodeproj",
    top_level_targets = [
        top_level_target(":SampleApp",target_environments = [ "simulator"],),
    ],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "SampleApp",
    bundle_id = "com.my.SampleApp",
    families = ["iphone", "ipad"],
    minimum_os_version = "15.0",
    infoplists =  ["info.plist"],
    deps = [":SampleAppLibrary"],
    resources = glob([
        "Assets.xcassets/**",
        "Others/*.xcconfig",
    ]),
    visibility = ["//visibility:public"],
)


