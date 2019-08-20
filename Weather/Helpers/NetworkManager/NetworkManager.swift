//
//  NetworkManager.swift
//  Contacts
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation
import UIKit

public enum NetworkEnvironment {
    case prod
    case develop
}

public extension NetworkEnvironment {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .prod:     return "https://api.worldweatheronline.com/premium/v1"
        case .develop:  return "https://api.worldweatheronline.com/premium/v1"
        }
    }
    
    var apiKey : String {
        switch NetworkManager.environment {
        case .prod:     return "b56811151f8841e096c103034191908"
        case .develop:  return "b56811151f8841e096c103034191908"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL not configured.")}
        return url
    }
    
}

public enum Result<String>{
    case success
    case failure(_ error : NetworkError)
}


public class NetworkManager {
    static let environment : NetworkEnvironment = .develop
    
    static let shared = NetworkManager()
    private init() {}
    
    let imageCache = NSCache<NSString, UIImage>()

    public func configure(environment: NetworkEnvironment)  {
        //TODO: helper method to set base url etc on app launch
    }
    
    func makeRequest(_ url: URL, completion: @escaping (_ data: Data?,_ response: Result<String>)->()) {
        let router = Router()
        
        router.request(url){ data, response, error in
            
            if error != nil {
                completion(nil, Result.failure(NetworkError.genericError))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                completion(data, result)
            }
        }
    }
    
    public func makeRequest(_ request: RequestProtocol, completion: @escaping (_ data: Data?,_ response: Result<String>)->()) -> Router{
        let router = Router()
        
        router.request(request) { data, response, error in
            debugPrint("Response: \(String(describing: response))")
            if error != nil {
                completion(nil, Result.failure(NetworkError.genericError))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.shared.handleNetworkResponse(response)
                completion(data, result)
            }
        }
        return router
    }
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...201: return .success
        case 204: return .success
        case 422: return .failure(NetworkError.validationError)
        case 500: return .failure(NetworkError.serverError)

        default: return .failure(NetworkError.failed)
        }
    }

}


public enum NetworkError :String {
    case success
    case notFound = "Not Found"
    case serverError = "Internal Server Error."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
    case genericError = "Please check your network connection."
    case validationError = "Validation Errors"
    case operationSuccess = "Operation success"

}

extension Data {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
