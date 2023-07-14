//
//  TopTags.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 13.07.23.
//

import Foundation

struct TopTagsResponse: Decodable {
    let toptags: TopTags
    
    struct TopTags: Decodable {
        let tag: [Tag]
    }
}
