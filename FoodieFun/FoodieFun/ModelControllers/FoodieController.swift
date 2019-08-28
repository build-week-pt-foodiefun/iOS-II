//
//  UsersController.swift
//  Random Users
//
//  Created by Enayatullah Naseri on 8/4/19.
//  Copyright © 2019 Erica Sadun. All rights reserved.
//

import Foundation

// Base url
private let baseURL = URL(string: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000")!


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
