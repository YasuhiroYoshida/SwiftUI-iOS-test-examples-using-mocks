//
//  MockWebService.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Yasuhiro Yoshida on 2022-02-06.
//

import Foundation

class MockWebService: NetworkService {
  func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
    if username == "JohnDoe" && password == "Password" {
      completion(.success(()))
    } else {
      completion(.failure(.notAuthenticated))
    }
  }
}
