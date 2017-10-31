import Moya
import Result

extension TMDB {
  public var configuration: MoyaProvider<ConfigurationService> {
    return createProvider(forTarget: ConfigurationService.self)
  }

  public var movies: MoyaProvider<Movies> {
    return createProvider(forTarget: Movies.self)
  }

  public var shows: MoyaProvider<Shows> {
    return createProvider(forTarget: Shows.self)
  }

  public var episodes: MoyaProvider<Episodes> {
    return createProvider(forTarget: Episodes.self)
  }

  private func createProvider<T: TMDBType>(forTarget target: T.Type) -> MoyaProvider<T> {
    let plugins = [PluginType]()

    let requestClosure = createRequestClosure(forTarget: target)

    return MoyaProvider<T>(requestClosure: requestClosure, plugins: plugins)
  }

  private func createRequestClosure<T: TMDBType>(forTarget target: T.Type) -> MoyaProvider<T>.RequestClosure {
    let requestClosure = { (endpoint: Endpoint<T>, done: MoyaProvider.RequestResultClosure) in
      guard let request = try? endpoint.urlRequest() else {
        done(.failure(MoyaError.requestMapping(endpoint.url)))
        return
      }

			guard let url = request.url else {
				done(.failure(MoyaError.requestMapping(endpoint.url)))
				return
			}

      var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

      var queryItems = components?.queryItems ?? [URLQueryItem]()
      queryItems.append(URLQueryItem(name: "api_key", value: self.apiKey))
      components?.queryItems = queryItems

      var newRequest = request

			guard let newURL = components?.url else {
				done(.failure(MoyaError.requestMapping(endpoint.url)))
				return
			}

      newRequest.url = newURL

      done(.success(newRequest))
    }

    return requestClosure
  }
}
