public final class Images: Codable {
  public let identifier: Int
  public let backdrops: [Image] = [Image]()
  public let posters: [Image] = [Image]()
  public let stills: [Image] = [Image]()

	enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case backdrops
		case posters
		case stills
	}
}
