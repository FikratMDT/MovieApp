//
//  CastManager.swift
//  MovieApp
//
//  Created by Fikrat on 19.10.22.
//

import Foundation
import UIKit

class CastManager {
    
    static let shared = CastManager()
    
    func getCasts (id: Int,complete: @escaping((CastList?, String?) -> ()) ) {        
        
        NetworkManager.shared.request(type: CastList.self,
                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)/credits?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
}
