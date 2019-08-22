//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailRequestModel : Codable {
	let type : String?
	let query : String?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case query = "query"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		query = try values.decodeIfPresent(String.self, forKey: .query)
	}

}
