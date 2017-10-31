public final class Image: Codable {
  public let filePath: String
  public let width: Int
  public let height: Int
  public let iso6391: String?
  public let aspectRatio: Float
  public let voteAverage: Float
  public let voteCount: Int

	enum CodingKeys: String, CodingKey {
		case filePath = "file_path"
		case width = "width"
		case height = "height"
		case iso6391 = "iso_639_1"
		case aspectRatio = "aspect_ratio"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}
