import Moya

public protocol TMDBType: TargetType {}

public extension TMDBType {

  public var baseURL: URL { return TMDB.baseURL }

  public var method: Moya.Method { return .get }

  public var headers: [String: String]? { return nil }

  public var sampleData: Data { return "".utf8Encoded }
}

func stubbedResponse(_ filename: String) -> Data {
  let resourcesPath = Bundle(for: TMDB.self).bundlePath
  let bundle = findBundleUsing(resourcesPath: resourcesPath)

	let url = bundle.url(forResource: filename, withExtension: "json")

  guard let fileURL = url, let data = try? Data(contentsOf: fileURL) else {
    return Data()
  }

  return data
}

private func findBundleUsing(resourcesPath: String) -> Bundle {
	var path = "/../"

	var bundle: Bundle? = nil
	var attempt = 0

	repeat {
		bundle = Bundle(path: resourcesPath.appending("\(path)TMDBTestsResources.bundle"))
		path.append("../")
		attempt += 1
	} while bundle == nil && attempt < 5

	return bundle!
}
