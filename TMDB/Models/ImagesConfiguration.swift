public final class ImagesConfiguration: Codable {
  public let secureBaseURL: String
  public let backdropSizes: [String]
  public let posterSizes: [String]
  public let stillSizes: [String]

	enum CodingKeys: String, CodingKey {
		case secureBaseURL = "secure_base_url"
		case backdropSizes = "backdrop_sizes"
		case posterSizes = "poster_sizes"
		case stillSizes = "still_sizes"
	}
}
