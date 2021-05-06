//
//  AfyaAPI.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation

public enum ResultType<Value> {
    case success(Value)
    case error(String)
}


class AfyaApi {
    
    public static let shared = AfyaApi()
    
    //MARK: - Chamadas API
    static func allSeries(completionHandler: @escaping (ResultType<[Show]>) -> Void) {
        
        RequestApi.makeRequest(type: [Show].self, toURL: Router.allSeries, completion: { (result) in
            switch result {
            
            case .success(let response):
                if let responseTemp = response {
                    completionHandler(ResultType.success(responseTemp))
                }
                break
            case .error(let errorString):
                completionHandler(ResultType.error(errorString))
                break
            }
        })
    }
    
}
