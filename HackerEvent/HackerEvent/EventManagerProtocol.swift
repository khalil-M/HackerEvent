//
//  EventManagerProtocol.swift
//  HackerEvent
//
//  Created by Khalil Mhelheli on 15/1/2023.
//

import Foundation


public protocol EventManagerProtocol {
    
    init(service: EventApiServiceProtocol)
    
    // MARK: - Browse
    func getAllEvents(completion: @escaping (Swift.Result<[Event], NetworkingServiceError>)->Void)
}

public class EventManager: EventManagerProtocol {
    
    var service: EventApiServiceProtocol
    
    public required init(service: EventApiServiceProtocol) {
        self.service = service
    }
    
    public func getAllEvents(completion: @escaping (Result<[Event], NetworkingServiceError>) -> Void) {
        service.getAllEvents { result in
            switch result {
            case .failure(let error):
                print(error)
                break
            case .success(_):
                completion(result)
                break
            }
        }
    }
    
    
}





