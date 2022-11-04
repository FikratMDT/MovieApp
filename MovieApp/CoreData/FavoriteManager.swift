//
//  FavoriteManager.swift
//  MovieApp
//
//  Created by Fikrat on 06.09.22.
//

import Foundation

class FavoriteManager {
    
    static let shared = FavoriteManager()
    var favoriteList = [Favorite]()
    let context = AppDelegate().persistentContainer.viewContext

    
    func fetch(complete: (() -> ())) {
        do {
            favoriteList = try context.fetch(Favorite.fetchRequest())
            complete()
        } catch {
             print(error.localizedDescription)
        }
    }
    
    func delete(index: Int) {
        context.delete(favoriteList[index])
        do {
            try context.save()
//            fetch()
        } catch{
            print(error.localizedDescription)
        }
    }
}
