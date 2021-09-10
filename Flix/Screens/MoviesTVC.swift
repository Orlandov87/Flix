//
//  MoviesTVC.swift
//  Flix
//
//  Created by Orlando Vargas on 9/4/21.
//

import UIKit
import AlamofireImage

class MoviesTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView = UITableView()

    var movies = [[String: Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeView()
        getMovies()
    }
    
    private func configureHomeView() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getMovies() {
        let url = URL(string: Constants.OVURL.movieURL)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try!
                JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.tableView.reloadData()
                //print(dataDictionary)
                
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier) as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let body = movie["overview"] as! String
        
        cell.titleLabel.text = title
        cell.bodyLabel.text = body
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseURL + posterPath)
        
        cell.movieView.af_setImage(withURL: posterUrl!)
        
        
        
        return cell
    }

}
