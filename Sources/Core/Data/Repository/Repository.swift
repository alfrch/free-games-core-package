//
//  Repository.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Combine

public protocol Repository {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
