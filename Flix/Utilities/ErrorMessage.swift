//
//  ErrorMessage.swift
//  Flix
//
//  Created by Orlando Vargas on 9/5/21.
//

import Foundation

enum OVError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was inavalid. Please try again."
}
