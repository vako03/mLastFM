//
//  WebServiceManager+error.swift
//  LastFM
//
//  Created by valeri mekhashishvili on 15.07.23.
//

import Foundation

extension WebServiceManager {
    enum WebServiceError: Error {
        case dataIsMissing
        case parsingError(Error)
        case responseError(Error)
        case incorrectUrl
    }
}
