//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct SearchResultModel : Codable {
	let areaName : [AreaNameModel]?
	let country : [CountryModel]?
	let region : [RegionModel]?
	let latitude : String?
	let longitude : String?
	let population : String?
	let weatherUrl : [WeatherUrlModel]?

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
		areaName = try values.decodeIfPresent([AreaNameModel].self, forKey: .areaName)
		country = try values.decodeIfPresent([CountryModel].self, forKey: .country)
		region = try values.decodeIfPresent([RegionModel].self, forKey: .region)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		population = try values.decodeIfPresent(String.self, forKey: .population)
		weatherUrl = try values.decodeIfPresent([WeatherUrlModel].self, forKey: .weatherUrl)
	}

}
