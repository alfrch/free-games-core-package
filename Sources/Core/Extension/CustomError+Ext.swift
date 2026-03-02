//
//  CustomError+Ext.swift
//  Core
//
//  Created by Alif Rachmawan on 25/02/26.
//

import Foundation

// MARK: - Network Error

public enum NetworkError: LocalizedError, Equatable {
  
  case invalidResponse
  case addressUnreachable(URL)
  case invalidURL
  case parsingError
  case unknown(Error)
  
  public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
    switch (lhs, rhs) {
    case (.invalidResponse, .invalidResponse),
      (.invalidURL, .invalidURL),
      (.parsingError, .parsingError):
      return true
    case (.addressUnreachable(let lhsURL), .addressUnreachable(let rhsURL)):
      return lhsURL == rhsURL
    case (.unknown(let lhsError), .unknown(let rhsError)):
      return lhsError.localizedDescription == rhsError.localizedDescription
    default:
      return false
    }
  }
  
  public var errorDescription: String? {
    switch self {
    case .invalidResponse: return "The server responded with garbage."
    case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    case .invalidURL: return "The provided URL is not in a valid format."
    case .parsingError: return "The data could not be parsed due to an invalid format."
    case .unknown(let error): return error.localizedDescription
    }
  }
}

// MARK: - Database Error

public enum DatabaseError: LocalizedError {
  
  case invalidInstance
  case requestFailed
  
  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
  
}
