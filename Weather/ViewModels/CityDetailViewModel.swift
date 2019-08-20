//
//  CityDetailViewModel.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import UIKit

struct CityDetailViewModel {
    
    //MARK: - Properties
    public var cityName : String?

    
    public var tempC : String?
    public var humidity : String?
    public var weatherDesc : String?
    public var weatherIconUrl : String?
    public var weatherIconImage : UIImage?

    
    //    //MARK: - Init
    init(value: CityDetailBaseModel) {
        tempC = value.data?.current_condition?.first?.temp_C
        humidity = value.data?.current_condition?.first?.humidity
        weatherDesc = value.data?.current_condition?.first?.weatherDesc?.first?.value
        weatherIconUrl = value.data?.current_condition?.first?.weatherIconUrl?.first?.value

    }
    
    init(value : CityViewModel){
        cityName = value.city
    }
    
    public var tempCText : String {
        guard let tempC = tempC else{
            return ""
        }
        return   tempC + "º"
    }
    
    public var humidityText : String {
        guard let humidity = humidity else{
            return ""
        }
        return  "Humidity:" +  humidity
    }
    
}
