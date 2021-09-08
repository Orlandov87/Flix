//
//  Movie.swift
//  Flix
//
//  Created by Orlando Vargas on 9/5/21.
//

import Foundation

struct Movie: Decodable, Hashable {
    var overview: String
    var posterPath: String
    var title: String
}
