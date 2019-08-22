//
//  Router.swift
//  Contacts
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
//    associatedtype EndPoint: RequestProtocol
    func request(_ route: RequestProtocol, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

public class Router: NetworkRouter {
    private var task: URLSessionTask?
    
    var formatKey = "format"
    let formatValue = "JSON"
    
    func request(_ route: RequestProtocol, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            debugPrint("NM: request : \(request)")
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        }catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func request(_ url: URL, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        let request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        debugPrint("NM: request : \(request)")
        task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    func request(_ urlRequest: URLRequest, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        let request = urlRequest
        debugPrint("NM: request : \(request)")
        task = session.dataTask(with: request, completionHandler: { data, response, error in
            completion(data, response, error)
        })
        self.task?.resume()
    }
    
    
    fileprivate func buildRequest(from route: RequestProtocol) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):

                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        
        var urlParametersWithKey = urlParameters
        urlParametersWithKey?.updateValue(NetworkManager.environment.apiKey, forKey: "key")
        urlParametersWithKey?.updateValue(formatValue, forKey: formatKey)
        
        
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParametersWithKey)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    
    
}

