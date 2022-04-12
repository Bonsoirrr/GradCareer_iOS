//
//  Results.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/9/22.
//

import Foundation

struct ResponseObject: Decodable {
    let data: [Posting]
    let links: Link
    let meta: Meta
}

struct Posting: Decodable {
    let slug, companyName, title, description: String
    let remote: Bool
    let url: String
    let tags, jobTypes: [String]
    let location: String
    let createdAt: Int
}

struct Link: Decodable {
    let first: URL?
    let last: URL?
    let prev: URL?
    let next: URL?
}

struct Meta: Decodable {
    let currentPage: Int
    let path: URL
    let perPage: Int
    let from: Int
    let to: Int
    let terms: String
    let info: String
}
