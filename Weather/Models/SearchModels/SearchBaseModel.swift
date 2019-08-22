//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchBaseModel : Codable {
	let search_api : SearchApiModel?

	enum CodingKeys: String, CodingKey {

		case search_api = "search_api"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		search_api = try values.decodeIfPresent(SearchApiModel.self, forKey: .search_api)
	}

}
