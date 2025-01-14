// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

/*
 ** 2022-02-25
 **
 ** The author disclaims copyright to this source code.  In place of
 ** a legal notice, here is a blessing:
 **
 **    May you do good and not evil.
 **    May you find forgiveness for yourself and forgive others.
 **    May you share freely, never taking more than you give.
 **
 ******************************************************************************
 **
 ** Swift Package Manager manifest for the CSQLite package.
 */

import PackageDescription

let package = Package(
	name: "CSQLite",
	products: [
		.library(
			name: "CSQLite",
			targets: [
				"CSQLite",
			]),
	],
	targets: [
		.target(
			name: "CSQLite",
			cSettings: [
				// Note: Keep in sync with https://github.com/simolus3/sqlite-native-libraries/blob/master/sqlite3-native-library/cpp/CMakeLists.txt
				.define("SQLITE_ENABLE_DBSTAT_VTAB"),
				.define("SQLITE_ENABLE_FTS5"),
				.define("SQLITE_ENABLE_RTREE"),
				.define("SQLITE_DQS=0"),
				.define("SQLITE_DEFAULT_MEMSTATUS=0"),
				.define("SQLITE_TEMP_STORE=2"),
				.define("SQLITE_MAX_EXPR_DEPTH=0"),
				.define("SQLITE_STRICT_SUBTYPE=1"),
				.define("SQLITE_OMIT_AUTHORIZATION"),
				.define("SQLITE_OMIT_DECLTYPE"),
				.define("SQLITE_OMIT_DEPRECATED"),
				.define("SQLITE_OMIT_PROGRESS_CALLBACK"),
				.define("SQLITE_OMIT_SHARED_CACHE"),
				.define("SQLITE_OMIT_TCL_VARIABLE"),
				.define("SQLITE_OMIT_TRACE"),
				.define("SQLITE_USE_ALLOCA"),
				.define("SQLITE_UNTESTABLE"),
				.define("SQLITE_HAVE_ISNAN"),
				.define("SQLITE_HAVE_LOCALTIME_R"),
				.define("SQLITE_HAVE_LOCALTIME_S"),
				.define("SQLITE_HAVE_MALLOC_USABLE_SIZE"),
				.define("SQLITE_HAVE_STRCHRNUL"),
				// Only the apple toolchains emit this error when compiling sqlite3 for some reason...
				//.unsafeFlags(["-Wno-ambiguous-macro"])
			],
			linkerSettings: [
				.linkedLibrary("m"),
			]),
		.testTarget(
			name: "CSQLiteTests",
			dependencies: [
				"CSQLite",
			])
	],
	cLanguageStandard: .gnu11
)
