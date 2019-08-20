//  Weather
//
//  Models
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
struct CityDetailMonthModel : Codable {
	let index : String?
	let name : String?
	let avgMinTemp : String?
	let avgMinTemp_F : String?
	let avgMaxTemp : String?
	let avgMaxTemp_F : String?
	let absMinTemp : String?
	let absMinTemp_F : String?
	let absMaxTemp : String?
	let absMaxTemp_F : String?
	let avgTemp : String?
	let avgTemp_F : String?
	let maxWindSpeed_kmph : String?
	let maxWindSpeed_mph : String?
	let maxWindSpeed_knots : String?
	let maxWindSpeed_ms : String?
	let avgWindSpeed_kmph : String?
	let avgWindSpeed_mph : String?
	let avgWindSpeed_knots : String?
	let avgWindSpeed_ms : String?
	let avgWindGust_kmph : String?
	let avgWindGust_mph : String?
	let avgWindGust_knots : String?
	let avgWindGust_ms : String?
	let avgDailyRainfall : String?
	let avgDailyRainfall_inch : String?
	let avgMonthlyRainfall : String?
	let avgMonthlyRainfall_inch : String?
	let avgHumidity : String?
	let avgCloud : String?
	let avgVis_km : String?
	let avgVis_miles : String?
	let avgPressure_mb : String?
	let avgPressure_inch : String?
	let avgDryDays : String?
	let avgRainDays : String?
	let avgSnowDays : String?
	let avgFogDays : String?
	let avgThunderDays : String?
	let avgUVIndex : String?
	let avgSunHour : String?

	enum CodingKeys: String, CodingKey {

		case index = "index"
		case name = "name"
		case avgMinTemp = "avgMinTemp"
		case avgMinTemp_F = "avgMinTemp_F"
		case avgMaxTemp = "avgMaxTemp"
		case avgMaxTemp_F = "avgMaxTemp_F"
		case absMinTemp = "absMinTemp"
		case absMinTemp_F = "absMinTemp_F"
		case absMaxTemp = "absMaxTemp"
		case absMaxTemp_F = "absMaxTemp_F"
		case avgTemp = "avgTemp"
		case avgTemp_F = "avgTemp_F"
		case maxWindSpeed_kmph = "maxWindSpeed_kmph"
		case maxWindSpeed_mph = "maxWindSpeed_mph"
		case maxWindSpeed_knots = "maxWindSpeed_knots"
		case maxWindSpeed_ms = "maxWindSpeed_ms"
		case avgWindSpeed_kmph = "avgWindSpeed_kmph"
		case avgWindSpeed_mph = "avgWindSpeed_mph"
		case avgWindSpeed_knots = "avgWindSpeed_knots"
		case avgWindSpeed_ms = "avgWindSpeed_ms"
		case avgWindGust_kmph = "avgWindGust_kmph"
		case avgWindGust_mph = "avgWindGust_mph"
		case avgWindGust_knots = "avgWindGust_knots"
		case avgWindGust_ms = "avgWindGust_ms"
		case avgDailyRainfall = "avgDailyRainfall"
		case avgDailyRainfall_inch = "avgDailyRainfall_inch"
		case avgMonthlyRainfall = "avgMonthlyRainfall"
		case avgMonthlyRainfall_inch = "avgMonthlyRainfall_inch"
		case avgHumidity = "avgHumidity"
		case avgCloud = "avgCloud"
		case avgVis_km = "avgVis_km"
		case avgVis_miles = "avgVis_miles"
		case avgPressure_mb = "avgPressure_mb"
		case avgPressure_inch = "avgPressure_inch"
		case avgDryDays = "avgDryDays"
		case avgRainDays = "avgRainDays"
		case avgSnowDays = "avgSnowDays"
		case avgFogDays = "avgFogDays"
		case avgThunderDays = "avgThunderDays"
		case avgUVIndex = "avgUVIndex"
		case avgSunHour = "avgSunHour"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		index = try values.decodeIfPresent(String.self, forKey: .index)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		avgMinTemp = try values.decodeIfPresent(String.self, forKey: .avgMinTemp)
		avgMinTemp_F = try values.decodeIfPresent(String.self, forKey: .avgMinTemp_F)
		avgMaxTemp = try values.decodeIfPresent(String.self, forKey: .avgMaxTemp)
		avgMaxTemp_F = try values.decodeIfPresent(String.self, forKey: .avgMaxTemp_F)
		absMinTemp = try values.decodeIfPresent(String.self, forKey: .absMinTemp)
		absMinTemp_F = try values.decodeIfPresent(String.self, forKey: .absMinTemp_F)
		absMaxTemp = try values.decodeIfPresent(String.self, forKey: .absMaxTemp)
		absMaxTemp_F = try values.decodeIfPresent(String.self, forKey: .absMaxTemp_F)
		avgTemp = try values.decodeIfPresent(String.self, forKey: .avgTemp)
		avgTemp_F = try values.decodeIfPresent(String.self, forKey: .avgTemp_F)
		maxWindSpeed_kmph = try values.decodeIfPresent(String.self, forKey: .maxWindSpeed_kmph)
		maxWindSpeed_mph = try values.decodeIfPresent(String.self, forKey: .maxWindSpeed_mph)
		maxWindSpeed_knots = try values.decodeIfPresent(String.self, forKey: .maxWindSpeed_knots)
		maxWindSpeed_ms = try values.decodeIfPresent(String.self, forKey: .maxWindSpeed_ms)
		avgWindSpeed_kmph = try values.decodeIfPresent(String.self, forKey: .avgWindSpeed_kmph)
		avgWindSpeed_mph = try values.decodeIfPresent(String.self, forKey: .avgWindSpeed_mph)
		avgWindSpeed_knots = try values.decodeIfPresent(String.self, forKey: .avgWindSpeed_knots)
		avgWindSpeed_ms = try values.decodeIfPresent(String.self, forKey: .avgWindSpeed_ms)
		avgWindGust_kmph = try values.decodeIfPresent(String.self, forKey: .avgWindGust_kmph)
		avgWindGust_mph = try values.decodeIfPresent(String.self, forKey: .avgWindGust_mph)
		avgWindGust_knots = try values.decodeIfPresent(String.self, forKey: .avgWindGust_knots)
		avgWindGust_ms = try values.decodeIfPresent(String.self, forKey: .avgWindGust_ms)
		avgDailyRainfall = try values.decodeIfPresent(String.self, forKey: .avgDailyRainfall)
		avgDailyRainfall_inch = try values.decodeIfPresent(String.self, forKey: .avgDailyRainfall_inch)
		avgMonthlyRainfall = try values.decodeIfPresent(String.self, forKey: .avgMonthlyRainfall)
		avgMonthlyRainfall_inch = try values.decodeIfPresent(String.self, forKey: .avgMonthlyRainfall_inch)
		avgHumidity = try values.decodeIfPresent(String.self, forKey: .avgHumidity)
		avgCloud = try values.decodeIfPresent(String.self, forKey: .avgCloud)
		avgVis_km = try values.decodeIfPresent(String.self, forKey: .avgVis_km)
		avgVis_miles = try values.decodeIfPresent(String.self, forKey: .avgVis_miles)
		avgPressure_mb = try values.decodeIfPresent(String.self, forKey: .avgPressure_mb)
		avgPressure_inch = try values.decodeIfPresent(String.self, forKey: .avgPressure_inch)
		avgDryDays = try values.decodeIfPresent(String.self, forKey: .avgDryDays)
		avgRainDays = try values.decodeIfPresent(String.self, forKey: .avgRainDays)
		avgSnowDays = try values.decodeIfPresent(String.self, forKey: .avgSnowDays)
		avgFogDays = try values.decodeIfPresent(String.self, forKey: .avgFogDays)
		avgThunderDays = try values.decodeIfPresent(String.self, forKey: .avgThunderDays)
		avgUVIndex = try values.decodeIfPresent(String.self, forKey: .avgUVIndex)
		avgSunHour = try values.decodeIfPresent(String.self, forKey: .avgSunHour)
	}

}
