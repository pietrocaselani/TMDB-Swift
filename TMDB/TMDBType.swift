import Moya

public protocol TMDBType: TargetType {}

public extension TMDBType {

  public var baseURL: URL { return TMDB.baseURL }

  public var method: Moya.Method { return .get }

  public var headers: [String: String]? { return nil }

  public var sampleData: Data { return "".utf8Encoded }
}

func stubbedResponse(_ filename: String) -> Data {
  let bundle = Bundle.testing

  let url = bundle.url(forResource: filename, withExtension: "json")

  guard let fileURL = url, let data = try? Data(contentsOf: fileURL) else {
    return Data()
  }

  return data
}
