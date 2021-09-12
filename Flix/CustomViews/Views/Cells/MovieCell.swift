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
    var posterView = OVPosterImageView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
//        viewHelp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewHelp() {
        titleLabel.backgroundColor = .blue
        bodyLabel.backgroundColor = .green
        posterView.backgroundColor = .yellow
    }
    
    private func configure() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(posterView)
        
        NSLayoutConstraint.activate([
            posterView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            posterView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            posterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            posterView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 46),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bodyLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
