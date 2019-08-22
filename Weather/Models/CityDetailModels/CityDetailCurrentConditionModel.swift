//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailCurrentConditionModel : Codable {
	let observation_time : String?
	let temp_C : String?
	let temp_F : String?
	let weatherCode : String?
	let weatherIconUrl : [CityDetailWeatherIconUrl]?
	let weatherDesc : [CityDetailWeatherDesc]?
	let windspeedMiles : String?
	let windspeedKmph : String?
	let winddirDegree : String?
	let winddir16Point : String?
	let precipMM : String?
	let precipInches : String?
	let humidity : String?
	let visibility : String?
	let visibilityMiles : String?
	let pressure : String?
	let pressureInches : String?
	let cloudcover : String?
	let feelsLikeC : String?
	let feelsLikeF : String?
	let uvIndex : Int?

	enum CodingKeys: String, CodingKey {

		case observation_time = "observation_time"
		case temp_C = "temp_C"
		case temp_F = "temp_F"
		case weatherCode = "weatherCode"
		case weatherIconUrl = "weatherIconUrl"
		case weatherDesc = "weatherDesc"
		case windspeedMiles = "windspeedMiles"
		case windspeedKmph = "windspeedKmph"
		case winddirDegree = "winddirDegree"
		case winddir16Point = "winddir16Point"
		case precipMM = "precipMM"
		case precipInches = "precipInches"
		case humidity = "humidity"
		case visibility = "visibility"
		case visibilityMiles = "visibilityMiles"
		case pressure = "pressure"
		case pressureInches = "pressureInches"
		case cloudcover = "cloudcover"
		case feelsLikeC = "FeelsLikeC"
		case feelsLikeF = "FeelsLikeF"
		case uvIndex = "uvIndex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		observation_time = try values.decodeIfPresent(String.self, forKey: .observation_time)
		temp_C = try values.decodeIfPresent(String.self, forKey: .temp_C)
		temp_F = try values.decodeIfPresent(String.self, forKey: .temp_F)
		weatherCode = try values.decodeIfPresent(String.self, forKey: .weatherCode)
		weatherIconUrl = try values.decodeIfPresent([CityDetailWeatherIconUrl].self, forKey: .weatherIconUrl)
		weatherDesc = try values.decodeIfPresent([CityDetailWeatherDesc].self, forKey: .weatherDesc)
		windspeedMiles = try values.decodeIfPresent(String.self, forKey: .windspeedMiles)
		windspeedKmph = try values.decodeIfPresent(String.self, forKey: .windspeedKmph)
		winddirDegree = try values.decodeIfPresent(String.self, forKey: .winddirDegree)
		winddir16Point = try values.decodeIfPresent(String.self, forKey: .winddir16Point)
		precipMM = try values.decodeIfPresent(String.self, forKey: .precipMM)
		precipInches = try values.decodeIfPresent(String.self, forKey: .precipInches)
		humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
		visibility = try values.decodeIfPresent(String.self, forKey: .visibility)
		visibilityMiles = try values.decodeIfPresent(String.self, forKey: .visibilityMiles)
		pressure = try values.decodeIfPresent(String.self, forKey: .pressure)
		pressureInches = try values.decodeIfPresent(String.self, forKey: .pressureInches)
		cloudcover = try values.decodeIfPresent(String.self, forKey: .cloudcover)
		feelsLikeC = try values.decodeIfPresent(String.self, forKey: .feelsLikeC)
		feelsLikeF = try values.decodeIfPresent(String.self, forKey: .feelsLikeF)
		uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
	}

}
