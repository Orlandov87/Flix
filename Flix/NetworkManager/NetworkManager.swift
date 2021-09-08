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
            
            //try catch block
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //print(dataDictionary.capacity)
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
                    
                    
                    let temp = Movie(overview: title, posterPath: poster, title: overview)
                    
                    movies.append(temp)
                }
                
                //print(movies[0]["title"]!)
               // print(movies[0]["overview"]!)
                //print(movies[0]["poster_path"]!)
                
                //let movies = try! decoder.decode([Movie].self, from: data)
                completed(.success(movies))

            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
