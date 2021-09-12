//
//  SuperHeroVC.swift
//  Flix
//
//  Created by Orlando Vargas on 9/12/21.
//

import UIKit

class SuperHeroVC: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange

        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
    }
}
