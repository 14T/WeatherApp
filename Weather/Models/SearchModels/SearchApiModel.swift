//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchApiModel : Codable {
	let searchResult : [SearchResultModel]?

	enum CodingKeys: String, CodingKey {

		case searchResult = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		searchResult = try values.decodeIfPresent([SearchResultModel].self, forKey: .searchResult)
	}

}
