//
//  Network Manager.swift
//  MovieApp
//
//  Created by Fikrat on 20.08.22.
//

import Foundation
import Alamofire
import CoreData

class NetworkManager{
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, complete: @escaping((T) -> ())){
        
        AF.request(url, method: method).responseData { response in
            if let data = response.data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    complete(model) 
                } catch {
                    print("catch error")
                }
            }
        }
//
//        AF.request(url, method: method).responseDecodable(of: T.self) { response in
//            switch response.result{
//            case .succes      s(let items):
//                complete(items)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}
