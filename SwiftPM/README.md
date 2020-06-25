# SwiftPM

A description of this package.

dependencies: [
        .package(url:"https://github.com/alibaba/HandyJSON.git", from: "5.0.1"),
        .package(url:"https://github.com/ReactiveX/RxSwift.git", from: "5.0")
    ],
    targets: [
        .target(
            name: "SwiftPM",
            dependencies: ["HandyJSON", "RxSwift", "RxCocoa"] // , "HandyJSON"
        ),
    ]
