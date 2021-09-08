//
//  MovieCell.swift
//  Flix
//
//  Created by Orlando Vargas on 9/8/21.
//

import UIKit

class MovieCell: UITableViewCell {
    static let identifier = "MovieCell"
    
    var titleLabel = OVTitleLabel(textAlignment: .center, fontSize: 16)
    var bodyLabel = OVBodyLabel()
    var movieView = OVPosterImageView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(movieView)
        
        NSLayoutConstraint.activate([
            movieView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            movieView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            movieView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieView.widthAnchor.constraint(equalToConstant: 110),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: movieView.trailingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
