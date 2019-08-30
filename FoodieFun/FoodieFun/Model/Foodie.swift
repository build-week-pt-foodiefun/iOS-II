//
//  Foodie.swift
//  FoodieFun
//
//  Created by Enayatullah Naseri on 8/22/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation
import UIKit


struct Users: Decodable {
    let results: [Foodie]
    
    enum UserKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserKeys.self)
        
        self.results = try container.decode([Foodie].self, forKey: .results)
    }
}

struct Foodie: Equatable, Codable {

    enum Keys: String, CodingKey {
        case name
        case result
        
        //Name enum
        enum App: String, CodingKey {
            case SignIn
            case RegisterUser
        }
    }
    
    let name: String
  
    
}

class AboutDev {
    let image: UIImage
    var devName: String
    var devTitle: String
    
    init (image: UIImage, devName: String, devTitle: String){
        self.image = image
        self.devName = devName
        self.devTitle = devTitle
    }
}


