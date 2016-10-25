
import PackageDescription

let package = Package(
	name: "TestingPerfectTemplate",
	targets: [],
	dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
		.Package(url: "git@github.com:ucotta/Session-MySQL.git",  majorVersion: 0)
    ]
)

