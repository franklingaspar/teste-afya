//
//  Router.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}


protocol Routeable {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseURLString: String { get }
    var body: Data? { get }
}

extension Routeable {
    private var baseURLString: String {
        return Constants.API.baseURL()
    }
    
    var mutableURLRequest: URLRequest {
        
        var mutableURLRequest = URLRequest(url: URL(string: baseURLString + path)!)
        
        mutableURLRequest.httpMethod = method.rawValue
        
        mutableURLRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        guard let body = body else {
            return mutableURLRequest
        }
        
        mutableURLRequest.httpBody = body
        
        return mutableURLRequest
    }
}

enum Router: Routeable {
    
    case allSeries
    
    internal var method: HTTPMethod {
        switch self {
        case .allSeries:
            return .get

            
        }
    }
    
    internal var path: String {
        switch self {
        
        case .allSeries:
            return Constants.API.allSeries
        
        }
    }
    
    internal var baseURLString: String {
        switch self {
        default:
            return Constants.API.baseURL()
        }
    }
    
    internal var body: Data? {
        switch self {
        
//        case .allSeires(let parameters):
//            return try! JSONEncoder().encode(parameters)
//

            

            
        default:
            return nil
        }
    }
    
}
