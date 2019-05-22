



import Foundation
struct NearbyRestaurants : Codable {
	let restaurant : Restaurant?

	enum CodingKeys: String, CodingKey {

		case restaurant = "restaurant"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		restaurant = try values.decodeIfPresent(Restaurant.self, forKey: .restaurant)
	}

}
