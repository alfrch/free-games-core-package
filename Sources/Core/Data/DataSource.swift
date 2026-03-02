//
//  DataSource.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Combine

public protocol DataSource {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
