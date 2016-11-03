
import PackageDescription

let package = Package(
	name: "MagicPerfectTemplate",
	targets: [],
	dependencies: [
		.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
		.Package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 2, minor: 0),
		.Package(url: "https://github.com/ucotta/Session-MySQL.git",  majorVersion: 0),
		.Package(url: "https://github.com/ucotta/BrilliantTemplate.git",  majorVersion: 0)
    ]
)

