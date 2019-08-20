//
//  CityDetailRequest.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation

public  class CityDetailRequest: RequestProtocol {
    
    
    public var path: String = "weather.ashx"
    
    public var httpMethod: HTTPMethod = .get
    
    public var headers: HTTPHeaders? = nil
    
    public var task: HTTPTask {
        return .requestParameters(bodyParameters: nil,
                                  bodyEncoding: .urlEncoding,
                                  urlParameters: ["q": queryString])
    }
    
    var queryString : String = ""
    
}
