//
//  UsersController.swift
//  Random Users
//
//  Created by Enayatullah Naseri on 8/4/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import Foundation
import UIKit


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// error tracking
enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

// Base url
private let baseURL = URL(string: "https://journal-ef55cc.firebaseio.com/")!


class FoodieController {
    
    var users: [Foodie] = []
    
    
    // fetching data
    func fetchUsers(completion: @escaping (Error?) -> Void = { _ in }) {
        
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching user data: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                NSLog("Error fetching user data: \(String(describing: error))")
                completion(error)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let random = try jsonDecoder.decode(Foodie.self, from: data)
                self.users = [random]
                completion(nil)
            } catch {
                NSLog("Error decoding data: \(error)")
                completion(nil)
                return
            }
        }
        
        dataTask.resume()
        
    }
    
    
}

class AboutControler {
    let nameArray = "Enayatullah"
    let titleArray = "Title Here"
    var aboutDev: [AboutDev] = []
    
    init() {
        loadAboutImagesFromAssets()
    }
    func loadAboutImagesFromAssets() {
        for x in 1...5 {
            let image: String = "Image\(x)"
            guard let UIImage = UIImage(named: image) else {return}
            let about = AboutDev(image: UIImage, devName: nameArray, devTitle: titleArray)
            aboutDev.append(about)
            
        }
    }
    
    
    
}




