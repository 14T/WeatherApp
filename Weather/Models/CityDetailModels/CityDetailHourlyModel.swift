//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailHourlyModel : Codable {
	let time : String?
	let tempC : String?
	let tempF : String?
	let windspeedMiles : String?
	let windspeedKmph : String?
	let winddirDegree : String?
	let winddir16Point : String?
	let weatherCode : String?
	let weatherIconUrl : [CityDetailWeatherIconUrl]?
	let weatherDesc : [CityDetailWeatherDesc]?
	let precipMM : String?
	let precipInches : String?
	let humidity : String?
	let visibility : String?
	let visibilityMiles : String?
	let pressure : String?
	let pressureInches : String?
	let cloudcover : String?
	let heatIndexC : String?
	let heatIndexF : String?
	let dewPointC : String?
	let dewPointF : String?
	let windChillC : String?
	let windChillF : String?
	let windGustMiles : String?
	let windGustKmph : String?
	let feelsLikeC : String?
	let feelsLikeF : String?
	let chanceofrain : String?
	let chanceofremdry : String?
	let chanceofwindy : String?
	let chanceofovercast : String?
	let chanceofsunshine : String?
	let chanceoffrost : String?
	let chanceofhightemp : String?
	let chanceoffog : String?
	let chanceofsnow : String?
	let chanceofthunder : String?
	let uvIndex : String?

	enum CodingKeys: String, CodingKey {

		case time = "time"
		case tempC = "tempC"
		case tempF = "tempF"
		case windspeedMiles = "windspeedMiles"
		case windspeedKmph = "windspeedKmph"
		case winddirDegree = "winddirDegree"
		case winddir16Point = "winddir16Point"
		case weatherCode = "weatherCode"
		case weatherIconUrl = "weatherIconUrl"
		case weatherDesc = "weatherDesc"
		case precipMM = "precipMM"
		case precipInches = "precipInches"
		case humidity = "humidity"
		case visibility = "visibility"
		case visibilityMiles = "visibilityMiles"
		case pressure = "pressure"
		case pressureInches = "pressureInches"
		case cloudcover = "cloudcover"
		case heatIndexC = "HeatIndexC"
		case heatIndexF = "HeatIndexF"
		case dewPointC = "DewPointC"
		case dewPointF = "DewPointF"
		case windChillC = "WindChillC"
		case windChillF = "WindChillF"
		case windGustMiles = "WindGustMiles"
		case windGustKmph = "WindGustKmph"
		case feelsLikeC = "FeelsLikeC"
		case feelsLikeF = "FeelsLikeF"
		case chanceofrain = "chanceofrain"
		case chanceofremdry = "chanceofremdry"
		case chanceofwindy = "chanceofwindy"
		case chanceofovercast = "chanceofovercast"
		case chanceofsunshine = "chanceofsunshine"
		case chanceoffrost = "chanceoffrost"
		case chanceofhightemp = "chanceofhightemp"
		case chanceoffog = "chanceoffog"
		case chanceofsnow = "chanceofsnow"
		case chanceofthunder = "chanceofthunder"
		case uvIndex = "uvIndex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		tempC = try values.decodeIfPresent(String.self, forKey: .tempC)
		tempF = try values.decodeIfPresent(String.self, forKey: .tempF)
		windspeedMiles = try values.decodeIfPresent(String.self, forKey: .windspeedMiles)
		windspeedKmph = try values.decodeIfPresent(String.self, forKey: .windspeedKmph)
		winddirDegree = try values.decodeIfPresent(String.self, forKey: .winddirDegree)
		winddir16Point = try values.decodeIfPresent(String.self, forKey: .winddir16Point)
		weatherCode = try values.decodeIfPresent(String.self, forKey: .weatherCode)
		weatherIconUrl = try values.decodeIfPresent([CityDetailWeatherIconUrl].self, forKey: .weatherIconUrl)
		weatherDesc = try values.decodeIfPresent([CityDetailWeatherDesc].self, forKey: .weatherDesc)
		precipMM = try values.decodeIfPresent(String.self, forKey: .precipMM)
		precipInches = try values.decodeIfPresent(String.self, forKey: .precipInches)
		humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
		visibility = try values.decodeIfPresent(String.self, forKey: .visibility)
		visibilityMiles = try values.decodeIfPresent(String.self, forKey: .visibilityMiles)
		pressure = try values.decodeIfPresent(String.self, forKey: .pressure)
		pressureInches = try values.decodeIfPresent(String.self, forKey: .pressureInches)
		cloudcover = try values.decodeIfPresent(String.self, forKey: .cloudcover)
		heatIndexC = try values.decodeIfPresent(String.self, forKey: .heatIndexC)
		heatIndexF = try values.decodeIfPresent(String.self, forKey: .heatIndexF)
		dewPointC = try values.decodeIfPresent(String.self, forKey: .dewPointC)
		dewPointF = try values.decodeIfPresent(String.self, forKey: .dewPointF)
		windChillC = try values.decodeIfPresent(String.self, forKey: .windChillC)
		windChillF = try values.decodeIfPresent(String.self, forKey: .windChillF)
		windGustMiles = try values.decodeIfPresent(String.self, forKey: .windGustMiles)
		windGustKmph = try values.decodeIfPresent(String.self, forKey: .windGustKmph)
		feelsLikeC = try values.decodeIfPresent(String.self, forKey: .feelsLikeC)
		feelsLikeF = try values.decodeIfPresent(String.self, forKey: .feelsLikeF)
		chanceofrain = try values.decodeIfPresent(String.self, forKey: .chanceofrain)
		chanceofremdry = try values.decodeIfPresent(String.self, forKey: .chanceofremdry)
		chanceofwindy = try values.decodeIfPresent(String.self, forKey: .chanceofwindy)
		chanceofovercast = try values.decodeIfPresent(String.self, forKey: .chanceofovercast)
		chanceofsunshine = try values.decodeIfPresent(String.self, forKey: .chanceofsunshine)
		chanceoffrost = try values.decodeIfPresent(String.self, forKey: .chanceoffrost)
		chanceofhightemp = try values.decodeIfPresent(String.self, forKey: .chanceofhightemp)
		chanceoffog = try values.decodeIfPresent(String.self, forKey: .chanceoffog)
		chanceofsnow = try values.decodeIfPresent(String.self, forKey: .chanceofsnow)
		chanceofthunder = try values.decodeIfPresent(String.self, forKey: .chanceofthunder)
		uvIndex = try values.decodeIfPresent(String.self, forKey: .uvIndex)
	}

}
