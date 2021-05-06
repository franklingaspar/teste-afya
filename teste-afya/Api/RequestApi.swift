//
//  RequestApi.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation

public enum ResultAPI<Value> {
    case success(Value?)
    case error(errorString: String)
}

class RequestApi {
    
    static func makeRequest<T: Codable>(type: T.Type, toURL url: Router, completion: @escaping (ResultAPI<T>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url.mutableURLRequest) { (data, response, error) in
            
            if let localError = RequestApi.handdleServerError(data: data as NSData?) {
                completion(ResultAPI.error(errorString:localError.localizedFailureReason ?? "Erro" ))
                return
            }

            do {
                guard let jsonFinal = data else { return }
                
    
                
                let userData = try JSONDecoder().decode(type.self, from: jsonFinal)
                DispatchQueue.main.async {
                    completion(ResultAPI.success(userData))
                }
                
            } catch {
                print("** Erro na rotina makeRequest ** ")
                print(error)
            }
        }
        task.resume()
    }
    
    
    private static func handdleServerError(data: NSData?) -> NSError? {
        var responseJSON: AnyObject?
        
        guard let data = data else {
            return Error.error(code: .dataSerializationFailed, failureReason: "Failed to read Data")
        }

        do {
            responseJSON = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch let error as NSError {
            return error
        }

        guard let JSON = responseJSON else {
            return Error.error(code: .jsonSerializationFailed, failureReason: "Failed to serialize JSON")
        }

        if let errorCode = JSON["error"] as? Int, errorCode != Error.ServerCode.success.rawValue && errorCode != Error.ServerCode.redirect.rawValue {
            return Error.error(code: errorCode, failureReason: Error.ServerCode(rawValue: errorCode).debugDescription)
        }

        
        return nil
    }
    
}
