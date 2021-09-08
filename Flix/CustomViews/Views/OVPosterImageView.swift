//
//  OVMovieImageView.swift
//  Flix
//
//  Created by Orlando Vargas on 9/8/21.
//

import UIKit

class OVPosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        contentMode = .scaleAspectFit
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
