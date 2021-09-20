//
//  DetailVC.swift
//  Flix
//
//  Created by Orlando Vargas on 9/16/21.
//

import UIKit

class DetailVC: UIViewController {

    //var movie: [Strin:Any]!
    var moviePoster = OVPosterImageView(frame: .zero)
    var movieBaner = OVPosterImageView(frame: .zero)
    var movieTitle = OVTitleLabel(textAlignment: .left, fontSize: 24)
    var movieDescription = OVBodyLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        //helper()
    }
    
    func helper() {
        moviePoster.backgroundColor = .blue
        movieBaner.backgroundColor = .yellow
        movieTitle.backgroundColor = .green
        movieDescription.backgroundColor = .orange
    }
    
    private func configure() {
        view.addSubview(movieBaner)
        view.addSubview(moviePoster)
        view.addSubview(movieTitle)
        view.addSubview(movieDescription)
        
        movieTitle.textColor = .white
        movieDescription.textColor = .white
        movieBaner.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            movieBaner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieBaner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieBaner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieBaner.heightAnchor.constraint(equalToConstant: view.bounds.height/4),
            moviePoster.topAnchor.constraint(equalTo: movieBaner.bottomAnchor, constant: -view.bounds.width/3),
            moviePoster.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            moviePoster.widthAnchor.constraint(equalToConstant: view.bounds.width/3),
            moviePoster.heightAnchor.constraint(equalToConstant: view.bounds.width/2),
            movieTitle.topAnchor.constraint(equalTo: movieBaner.bottomAnchor, constant: 16),
            movieTitle.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 16),
            movieTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieDescription.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 16),
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
}

extension DetailVC: MovieDetailDelegate {
    func didTapChoice(movie: [String : Any]) {
        movieTitle.text = movie["title"] as? String
        movieDescription.text = movie["overview"] as? String
        let posterPath = movie["poster_path"] as! String
        let bannerPath = movie["backdrop_path"] as! String
        let posterUrl = URL(string: Constants.OVURL.posterBaseURL + posterPath)
        let bannerUrl = URL(string: Constants.OVURL.posterBaseURL + bannerPath)
        moviePoster.af.setImage(withURL: posterUrl!)
        movieBaner.af.setImage(withURL: bannerUrl!)
    }
}
