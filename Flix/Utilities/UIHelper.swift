//
//  UIHelper.swift
//  Flix
//
//  Created by Orlando Vargas on 9/12/21.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
            let width = view.bounds.width
            let padding: CGFloat = 6
            let minimumItemSpacing: CGFloat = 10
            let availableWidth = width - (padding*2) - (minimumItemSpacing*2)
            let itemWidth = availableWidth / 3
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
            
            return flowLayout
        }
    
    static func createSixColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        
        let flowLayout = UICollectionViewFlowLayout()
        // MARK: TODO 
        return flowLayout
    }
}
