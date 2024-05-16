# tuist-external-dependency-plugin
This plugin support to allow to declare external dependencies simply and programatically.

As follow,

```swift
dependencies: [
    // Before
//  .external(name: "RxSwift"),
//  .external(name: "RxCocoa"),
    // After
    .external(name: .rxSwift),
    .external(name: .rxCocoa),
]

```

## Usage

### # Prepare packages

It's the same way Tuist recommends. Tuist [documentation](https://docs.tuist.io/guide/project/dependencies.html#external-dependencies).  
This plugin **does not specify packages** to use. Just supports using the name of external dependencies programmatically.  
So, you have to declare `Package.swift` file like below,

#### Package.swift

```swift
// swift-tools-version: 5.10
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            :
        ]
    )
#endif

let package = Package(
    name: "ExternalDependency",
    dependencies: [
        // RxSwift
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.6.0"),
        // Other packages...
    ]
)

```

### # Import plugin

To use the features provided this plugin, declare that using plugin in `Config.swift` file.

#### Config.swift

```swift
import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/Woin2ee-Modules/tuist-external-dependency-plugin.git", tag: "1.0.0"),
    ]
)
```

### # Declare external dependency

```swift
let target = Target.target(
    name: "Name",
    destinations: .iOS,
    product: .framework,
    bundleId: "BundleID",
    dependencies: [
        .external(name: .rxSwift),
        .external(name: .rxCocoa),
        // ...
    ]
)
```

## Default supports external dependencies
Check it out [here](https://github.com/Woin2ee-Modules/tuist-external-dependency-plugin/blob/main/ProjectDescriptionHelpers/ExternalDependencyName%2BDefault.swift)

## Compatibility

- [Tuist](https://github.com/tuist/tuist) : 4.11.0 ~


