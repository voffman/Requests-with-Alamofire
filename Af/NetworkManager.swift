//
//  ApiManager.swift
//  Af
//
//  Created by Владимир Свиридов on 08.02.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    /*
   func getRequest(url: URLConvertible, headers: HTTPHeaders){
        AF.request(url, headers: headers).responseJSON { response in
            print(response)
        }
    } */
    
    func getRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, model: T.Type ,completion:  @escaping ([T])->()){
        AF.request(url, headers: headers).validate().responseDecodable(of: [T].self) { response in
            switch response.result {
            case .success(let posts):
                
                completion(posts)
                
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
    }
    
    func getRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, model: T.Type ,completion: @escaping (T)->()){
        AF.request(url, headers: headers).validate().responseDecodable(of: [T].self) { response in
            switch response.result {
            case .success(let posts):
                
                for post in posts{
                    completion(post)
                }
                
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
    }
    
    func postRequest(url: URLConvertible, headers: HTTPHeaders, body: [String: Any]){
        AF.request(url, method: .post, parameters: body, encoding:  URLEncoding.queryString, headers: headers).response { response in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func postRequest<T: Decodable>(url: URLConvertible, headers: HTTPHeaders, body: [String: Any], model: T.Type ,completion: @escaping (T)->()) {
        AF.request(url, method: .post, parameters: body, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case let .success(result):
                completion(result)
                
            case let .failure(error):
                print("Error description is: \(String(describing: error))")
                
            }
        }
    }
}
