//
//  WeatherIconService.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import UIKit

struct WeatherIconService {
    
    func getProfilePic(path: String, completion: @escaping (_ image: UIImage?, _ error: String?)->()){
        
        if path.contains("http"),  let url = URL(string: path) {
            NetworkManager.shared.makeRequest(url) { (data, result) in
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkError.noData.rawValue)
                        return
                    }
                    
                    guard let image = UIImage(data: responseData) else {
                        completion(nil, NetworkError.noData.rawValue)
                        return
                    }
                    completion(image, nil)
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError.rawValue)
                }
            }
            
            return  //exit here
        }
        
        
    }
    
}
