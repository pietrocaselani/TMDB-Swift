extension Bundle {
  static var testing: Bundle {
    let bundle = Bundle(for: TMDB.self)

    let path = bundle.bundlePath.appending("/../../../../TMDBTestsResources.bundle")
    let testingBundle = Bundle(path: path)

    return testingBundle!
  }
}
