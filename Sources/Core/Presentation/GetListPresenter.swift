//
//  GetListPresenter.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Foundation
import Combine

public class GetListPresenter<Request, Response, Interactor: UseCase>: ObservableObject
where Interactor.Request == Request, Interactor.Response == [Response] {
  
  private var cancellables: Set<AnyCancellable> = []
  private let _useCase: Interactor
  
  @Published public var list: [Response] = []
  @Published public var errorMesasage: String?
  @Published public var isLoading = false
  @Published public var isError = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  public func getList(request: Request?) {
    isLoading = true
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { [weak self] completion in
        guard let self else { return }
        switch completion {
        case .failure(let error):
          self.errorMesasage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { [weak self] list in
        guard let self else { return }
        self.list = list
      })
      .store(in: &cancellables)
  }
  
}
