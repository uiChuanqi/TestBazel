# TestBazel
After upgrading my rules_apple to the latest 2.4.1, when i execute the command line "bazel build //SampleApp:SampleApp" , it reports an error as shown in the image:
![bazel_build_error.png](https://user-images.githubusercontent.com/112925246/253466882-7505ec40-7fed-4429-8e7b-52d7819fc152.png "rules_apple version 2.4.1 & 2.4.0 build error")

According to the release list(https://github.com/bazelbuild/rules_apple/releases), I degrade the version gradually from 2.4.1 to 2.1.0(which was my current version then), and i found that if you use a version earlier than 2.4.0, such as 2.3.0, 2.2.0, 2.1.0, the error will disappear. 

It is worth mentioning that if you execute this command line  "bazel run //SampleApp:xcodeproj", it won't give you any error.

## Steps

1 . Open the terminal and cd to the SampleApp 

2 . Run this below commond line:

     `bazel build //SampleApp:SampleApp`
