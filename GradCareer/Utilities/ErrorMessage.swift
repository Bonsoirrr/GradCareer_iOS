//
//  ErrorMessage.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/9/22.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Somthing went wrong, try again"
    case invalidResponse = "Server error. Please modify your search and try again"
}
