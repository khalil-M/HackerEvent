//
//  NetworkingServiceError.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 14/1/2023.
//
//

import Foundation

public enum NetworkingServiceError: Swift.Error {
    case connectivity
    case invalidData
    case badRequest
    case notAuthorized
}
