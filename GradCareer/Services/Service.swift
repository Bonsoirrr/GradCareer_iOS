//
//  Service.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/9/22.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    enum WebServiceError: Error {
        case httpError(Data, Int)
    }
    
    func getResults(completion: @escaping (Result<[Posting], Error>) -> Void) {
        let urlString = "https://www.arbeitnow.com/api/job-board-api"
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                error == nil
            else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }

            guard 200 ..< 300 ~= response.statusCode else {
                completion(.failure(WebServiceError.httpError(data, response.statusCode)))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(ResponseObject.self, from: data)
                completion(.success(results.data))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
