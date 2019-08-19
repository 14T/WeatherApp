//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchResult : Codable {
	let areaName : [AreaName]?
	let country : [Country]?
	let region : [Region]?
	let latitude : String?
	let longitude : String?
	let population : String?
	let weatherUrl : [WeatherUrl]?

	enum CodingKeys: String, CodingKey {

		case areaName = "areaName"
		case country = "country"
		case region = "region"
		case latitude = "latitude"
		case longitude = "longitude"
		case population = "population"
		case weatherUrl = "weatherUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		areaName = try values.decodeIfPresent([AreaName].self, forKey: .areaName)
		country = try values.decodeIfPresent([Country].self, forKey: .country)
		region = try values.decodeIfPresent([Region].self, forKey: .region)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		population = try values.decodeIfPresent(String.self, forKey: .population)
		weatherUrl = try values.decodeIfPresent([WeatherUrl].self, forKey: .weatherUrl)
	}

}
