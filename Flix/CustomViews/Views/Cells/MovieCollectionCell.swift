//
//  MovieCollectionCell.swift
//  Flix
//
//  Created by Orlando Vargas on 9/12/21.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    static let identifier = "MovieCollectionCell"
    var posterView = OVPosterImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(posterView)
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
