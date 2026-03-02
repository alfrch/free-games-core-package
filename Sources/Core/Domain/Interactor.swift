//
//  Interactor.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Foundation
import Combine

public struct Interactor<Request, Response, R: Repository>: UseCase
where R.Request == Request, R.Response == Response {
  
  private let _repository: R
  
  public init(repository: R) {
    _repository = repository
  }
  
  public func execute(request: Request?) -> AnyPublisher<Response, any Error> {
    _repository.execute(request: request)
  }
  
}
