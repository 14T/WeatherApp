//
//  WeatherIconRequest.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
public  class WeatherIconRequest : RequestProtocol {
    
    public var path: String = ""
    
    public var httpMethod: HTTPMethod = .get
    
    public var headers: HTTPHeaders? = nil
    
    public var task: HTTPTask {
        return .request
    }
    
}
