//
//  NetworkManager.swift
//  Flix
//
//  Created by Orlando Vargas on 9/5/21.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = Constants.OVURL.movieURL
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getMovies(completed: @escaping(Result<[Movie], OVError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                var apiData = [[String:Any]]()
                var movies: [Movie] = []
                
                apiData = dataDictionary["results"] as! [[String:Any]]
                
                var title: String
                var overview: String
                var poster: String
                
                for movie in apiData {
                    title = movie["title"] as! String
                    overview = movie["overview"] as! String
                    poster = movie["poster_path"] as! String
                    
                    movies.append(Movie(overview: title, posterPath: poster, title: overview))
                }
                completed(.success(movies))
            }
        }
        task.resume()
    }
}
