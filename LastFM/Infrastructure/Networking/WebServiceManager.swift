//
//  WebServiceManager.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 14.07.23.
//

import Foundation
import Foundation

protocol WebServiceManaging {
    func get<T: Decodable>(url: String, completion: @escaping (Result<T, WebServiceManager.WebServiceError>) -> Void)
}

final class WebServiceManager: WebServiceManaging {
    func get<T: Decodable>(url: String, completion: @escaping (Result<T, WebServiceManager.WebServiceError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.incorrectUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.responseError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataIsMissing))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(.parsingError(error)))
            }
        }.resume()
    }
    
}

