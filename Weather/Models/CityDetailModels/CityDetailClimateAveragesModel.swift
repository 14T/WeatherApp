//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailClimateAveragesModel : Codable {
	let month : [CityDetailMonthModel]?

	enum CodingKeys: String, CodingKey {

		case month = "month"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		month = try values.decodeIfPresent([CityDetailMonthModel].self, forKey: .month)
	}

}
