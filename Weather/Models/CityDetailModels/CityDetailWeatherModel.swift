//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailWeatherModel : Codable {
	let date : String?
	let astronomy : [CityDetailAstronomyModel]?
	let maxtempC : String?
	let maxtempF : String?
	let mintempC : String?
	let mintempF : String?
	let avgtempC : String?
	let avgtempF : String?
	let totalSnow_cm : String?
	let sunHour : String?
	let uvIndex : String?
	let hourly : [CityDetailHourlyModel]?

	enum CodingKeys: String, CodingKey {

		case date = "date"
		case astronomy = "astronomy"
		case maxtempC = "maxtempC"
		case maxtempF = "maxtempF"
		case mintempC = "mintempC"
		case mintempF = "mintempF"
		case avgtempC = "avgtempC"
		case avgtempF = "avgtempF"
		case totalSnow_cm = "totalSnow_cm"
		case sunHour = "sunHour"
		case uvIndex = "uvIndex"
		case hourly = "hourly"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		astronomy = try values.decodeIfPresent([CityDetailAstronomyModel].self, forKey: .astronomy)
		maxtempC = try values.decodeIfPresent(String.self, forKey: .maxtempC)
		maxtempF = try values.decodeIfPresent(String.self, forKey: .maxtempF)
		mintempC = try values.decodeIfPresent(String.self, forKey: .mintempC)
		mintempF = try values.decodeIfPresent(String.self, forKey: .mintempF)
		avgtempC = try values.decodeIfPresent(String.self, forKey: .avgtempC)
		avgtempF = try values.decodeIfPresent(String.self, forKey: .avgtempF)
		totalSnow_cm = try values.decodeIfPresent(String.self, forKey: .totalSnow_cm)
		sunHour = try values.decodeIfPresent(String.self, forKey: .sunHour)
		uvIndex = try values.decodeIfPresent(String.self, forKey: .uvIndex)
		hourly = try values.decodeIfPresent([CityDetailHourlyModel].self, forKey: .hourly)
	}

}
