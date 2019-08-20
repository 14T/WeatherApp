//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailDataModel : Codable {
	let request : [CityDetailRequestModel]?
	let current_condition : [CityDetailCurrentConditionModel]?
	let weather : [CityDetailWeatherModel]?
	let climateAverages : [CityDetailClimateAveragesModel]?

	enum CodingKeys: String, CodingKey {

		case request = "request"
		case current_condition = "current_condition"
		case weather = "weather"
		case climateAverages = "ClimateAverages"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		request = try values.decodeIfPresent([CityDetailRequestModel].self, forKey: .request)
		current_condition = try values.decodeIfPresent([CityDetailCurrentConditionModel].self, forKey: .current_condition)
		weather = try values.decodeIfPresent([CityDetailWeatherModel].self, forKey: .weather)
		climateAverages = try values.decodeIfPresent([CityDetailClimateAveragesModel].self, forKey: .climateAverages)
	}

}
