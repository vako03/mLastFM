//
//  DataService.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 14.07.23.
//

import Foundation

class DataService {
    private let webServiceManaging: WebServiceManaging
    
    init(webServiceManaging: WebServiceManaging) {
        self.webServiceManaging = webServiceManaging
    }
    
    func fetchData(completion: @escaping ([Tag]) -> Void) {
        webServiceManaging.get(url: "https://ws.audioscrobbler.com/2.0/?method=tag.getTopTags&api_key=8a0e338471e81bb0dffeaa37600d414b&format=json") { (result: Result<TopTagsResponse, WebServiceManager.WebServiceError>) in
            switch result {
            case .success(let response):
                completion(response.toptags.tag)
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }
}

