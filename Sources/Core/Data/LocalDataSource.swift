//
//  LocalDataSource.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Combine

public protocol LocalDataSource {
  associatedtype Request
  associatedtype Response
  
  func list(request: Request?) -> AnyPublisher<[Response], Error>
  func add(entities: [Response]) -> AnyPublisher<Bool, Error>
  func get(id: String) -> AnyPublisher<Response, Error>
  func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error>
}
