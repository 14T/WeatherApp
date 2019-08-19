//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchApi : Codable {
	let result : [SearchResult]?

	enum CodingKeys: String, CodingKey {

		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		result = try values.decodeIfPresent([SearchResult].self, forKey: .result)
	}

}
