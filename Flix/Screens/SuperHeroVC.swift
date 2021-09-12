//
//  SuperHeroVC.swift
//  Flix
//
//  Created by Orlando Vargas on 9/12/21.
//

import UIKit
import AlamofireImage

class SuperHeroVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var collectionView: UICollectionView!
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange

        configureView()
        getMovies()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        
        view.addSubview(collectionView)
    }
    
    private func getMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String: Any]]
                self.collectionView.reloadData()
                print(self.movies)
            }
        }
        task.resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        
        let movie = movies[indexPath.item]
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: Constants.OVURL.posterBaseURL + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        
        return cell
    }
}
