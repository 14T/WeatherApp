//
//  SearchCityService.swift
//  Weather
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation

class SearchCityService {
    var task : Router?
    var timer:Timer? //used for continious typing scenario, disabled for now
    func searchCity(query: String, completion: @escaping (_ results: [SearchResultModel]?, _ error: String?)->()){
        timer?.invalidate()
        //setup timer
        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false, block: { (timer) in
            
            self.task?.cancel()
            
            let request = SearchCityRequest()
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
                        
                        let results =  try decoder.decode(SearchBaseModel.self, from: responseData)
                        completion(results.search_api?.searchResult,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkError.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError.rawValue)
                }
            }
        })
        
      
        
        
    }
    
    
}
