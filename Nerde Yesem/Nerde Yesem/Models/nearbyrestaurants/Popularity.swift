





import Foundation
struct Popularity : Codable {
	let popularity : String?
	let nightlife_index : String?
	let nearby_res : [String]?
	let top_cuisines : [String]?
	let popularity_res : String?
	let nightlife_res : String?
	let subzone : String?
	let subzone_id : Int?
	let city : String?

	enum CodingKeys: String, CodingKey {

		case popularity = "popularity"
		case nightlife_index = "nightlife_index"
		case nearby_res = "nearby_res"
		case top_cuisines = "top_cuisines"
		case popularity_res = "popularity_res"
		case nightlife_res = "nightlife_res"
		case subzone = "subzone"
		case subzone_id = "subzone_id"
		case city = "city"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		popularity = try values.decodeIfPresent(String.self, forKey: .popularity)
		nightlife_index = try values.decodeIfPresent(String.self, forKey: .nightlife_index)
		nearby_res = try values.decodeIfPresent([String].self, forKey: .nearby_res)
		top_cuisines = try values.decodeIfPresent([String].self, forKey: .top_cuisines)
		popularity_res = try values.decodeIfPresent(String.self, forKey: .popularity_res)
		nightlife_res = try values.decodeIfPresent(String.self, forKey: .nightlife_res)
		subzone = try values.decodeIfPresent(String.self, forKey: .subzone)
		subzone_id = try values.decodeIfPresent(Int.self, forKey: .subzone_id)
		city = try values.decodeIfPresent(String.self, forKey: .city)
	}

}
