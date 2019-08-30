//
//  ViewController.swift
//  FoodieFun
//
//  Created by Enayatullah Naseri on 8/28/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let devs = ["Chris Daley", "Enayatullah Naseri", "Gajah Mada Gower", "Jake Gifford", "Jason Camacho", "Scott Bennett"]
    let titles = ["UI DEVELOPER", "IOS Developer", "FRONT END DEVELOPER", "UI DEVELOPER", "FRONT END DEVELOPER", "Project Lead"]
    
    let devImages: [UIImage] = [
    UIImage(named: "Image1")!,
    UIImage(named: "Image2")!,
    UIImage(named: "Image3")!,
    UIImage(named: "Image4")!,
    UIImage(named: "Image5")!,
    UIImage(named: "Image6")!
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return devs.count
//        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AboutCellCollection", for: indexPath) as! CollectionViewCell
        
        cell.nameLable.text = devs[indexPath.item]
        cell.titleLable.text = titles[indexPath.item]
        cell.imageView.image = devImages[indexPath.item]
        
        return cell
    }

}
