//
//  CityDetailService.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 20/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation

class CityDetailService {
    var task : Router?
    
    func getCityDetail(query: String, completion: @escaping (_ results: CityDetailBaseModel?, _ error: String?)->()){
        
        
        self.task?.cancel()
        
        let request = CityDetailRequest()
        request.queryString = query
        
        self.task = NetworkManager.shared.makeRequest(request) { (data, result) in
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkError.noData.rawValue)
                    return
                }
                let decoder = JSONDecoder.init()
                
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    debugPrint(jsonData)
                    
                    let results =  try decoder.decode(CityDetailBaseModel.self, from: responseData)
                 
                    completion(results,nil)
                }catch {
                    print(error)
                    completion(nil, NetworkError.unableToDecode.rawValue)
                }
            case .failure(let networkFailureError):
                completion(nil, networkFailureError.rawValue)
            }
        }

    }
    
    
}
