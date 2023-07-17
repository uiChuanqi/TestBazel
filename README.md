# TestBazel
After upgrading my rules_apple to the latest 2.4.1, when i execute the command line "bazel build //SampleApp:SampleApp" , it reports an error as shown in the image:
![bazel_build_error.png](https://user-images.githubusercontent.com/112925246/253466882-7505ec40-7fed-4429-8e7b-52d7819fc152.png "rules_apple version 2.4.1 & 2.4.0 build error")

According to the release list(https://github.com/bazelbuild/rules_apple/releases), I degrade the version gradually from 2.4.1 to 2.1.0(which was my current version then), and i found that if you use a version earlier than 2.4.0, such as 2.3.0, 2.2.0, 2.1.0, the error will disappear. 

It is worth mentioning that if you execute this command line  "bazel run //SampleApp:xcodeproj", it won't give you any error.

## Reproduce Steps

1. `cd SampleApp`
2. `bazel build //SampleApp:SampleApp`. It should build without errors.
3. Change `WORKSPACE` L33 from `tag = 2.3.0` to `tag = "2.4.1"`
4. Re-run `bazel build //SampleApp:SampleApp`. It should built without errors, but instead it will show: 

```
INFO: Analyzed target //SampleApp:SampleApp (63 packages loaded, 951 targets configured).
INFO: Found 1 target...
ERROR: ...../TestBazel/SampleApp/BUILD:42:16: MetallibCompile SampleApp/SampleApp-intermediates/default.metallib failed: (Exit 1): xcrun failed: error executing command (from target //SampleApp:SampleApp) /usr/bin/xcrun metallib -o bazel-out/applebin_ios-ios_sim_arm64-fastbuild-ST-9204ac8255b1/bin/SampleApp/SampleApp-intermediates/default.metallib

Use --sandbox_debug to see verbose messages from the sandbox and retain the sandbox build root for debugging
metallib: error: no input files
Target //SampleApp:SampleApp failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 7.850s, Critical Path: 0.78s
INFO: 3 processes: 3 internal.
FAILED: Build did NOT complete successfully
```
