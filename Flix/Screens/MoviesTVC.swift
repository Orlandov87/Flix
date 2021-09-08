//
//  MoviesTVC.swift
//  Flix
//
//  Created by Orlando Vargas on 9/4/21.
//

import UIKit

class MoviesTVC: UITableViewController {
    
    enum Section { case main }
    var movies: [Movie] = []
    var hasMoreMovies = true
    
    var dataSource: UITableViewDiffableDataSource<Section, Movie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeView()
        getMovies()
        updateData(on: movies)
    }
    
    private func configureHomeView() {
        
    }
    
    func getMovies() {
        NetworkManager.shared.getMovies() { [weak self] result in
            
            guard let self = self else { return } // since Self is weak you'll need to unwrap it.
            //self.dismissLoadingView()
            switch result {
            case .success(let movies):
                if movies.count < 100 { self.hasMoreMovies = false }
                self.movies.append(contentsOf: movies)
                
                if self.movies.isEmpty {
                    //let message = "This user doens't have any followers. Go follow them  😄."
                    DispatchQueue.main.async {
                        //self.showEmptyStateView(with: message, in: self.view)
                    }
                    
                }
                self.updateData(on: self.movies)
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happen", message: error.rawValue, buttonTitle: "Ok")
                print(error)
            }
        }
    }
    
    func updateData(on movies: [Movie]) {
        print(movies)
    }
}
