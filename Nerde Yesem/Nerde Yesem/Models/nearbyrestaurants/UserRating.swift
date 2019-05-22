




import Foundation
struct UserRating : Codable {
	let aggregate_rating : String?
	let rating_text : String?
	let rating_color : String?
	let votes : String?

	enum CodingKeys: String, CodingKey {

		case aggregate_rating = "aggregate_rating"
		case rating_text = "rating_text"
		case rating_color = "rating_color"
		case votes = "votes"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		aggregate_rating = try values.decodeIfPresent(String.self, forKey: .aggregate_rating)
		rating_text = try values.decodeIfPresent(String.self, forKey: .rating_text)
		rating_color = try values.decodeIfPresent(String.self, forKey: .rating_color)
		votes = try values.decodeIfPresent(String.self, forKey: .votes)
	}

}
