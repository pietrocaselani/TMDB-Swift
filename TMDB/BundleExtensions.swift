extension Bundle {
  static var testing: Bundle {
    let bundle = Bundle(identifier: "org.cocoapods.TMDB-Tests")!

    let path = bundle.bundlePath.appending("/../TMDBTestsResources.bundle")
    let testingBundle = Bundle(path: path)

    return testingBundle!
  }
}
