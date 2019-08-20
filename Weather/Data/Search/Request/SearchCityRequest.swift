//
//  SearchCityRequest.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation

public  class SearchCityRequest: RequestProtocol {
    
    
    public var path: String = "search.ashx"
    
    public var httpMethod: HTTPMethod = .get
    
    public var headers: HTTPHeaders? = nil
    
    public var task: HTTPTask {
        return .requestParameters(bodyParameters: nil,
                                  bodyEncoding: .urlEncoding,
                                  urlParameters: ["query": queryString])
    }
    
    var queryString : String = ""
    
}
