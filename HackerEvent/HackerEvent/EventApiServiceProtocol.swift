//
//  EventApiServiceProtocol.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 15/1/2023.
//

import Foundation

public protocol EventApiServiceProtocol {
    typealias ServiceError = NetworkingServiceError
    init(baseURL: URL, client: HTTPClient)
    
    // MARK: - Browse
    func getAllEvents(completion: @escaping (Swift.Result<[Event], ServiceError>)->Void)
}

public class EventApiService: EventApiServiceProtocol {
    
    private var baseURL: URL
    private var client: HTTPClient
    
    public typealias ServiceError = NetworkingServiceError
    
    required public init(baseURL: URL, client: HTTPClient) {
        self.baseURL = baseURL
        self.client = client
    }
    
    //https://kontests.net/api/v1/all
    public func getAllEvents(completion: @escaping (Result<[Event], ServiceError>) -> Void) {
        let url = baseURL.appendingPathComponent("/all")
        client.makeRequest(toURL: url, withHttpMethod: .get) {  [weak self] result in
            guard self != nil else { return }
            print(result)
            completion(GenericDecoder.decodeResult(result: result))
        }

    }
}

