//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Yasuhiro Yoshida on 2022-02-06.
//

import Foundation

class NetworkServiceFactory {
  static func create() -> NetworkService {
    if let env = ProcessInfo.processInfo.environment["ENV"] {
      if env == "Test" {
        return MockWebService()
      }
    }
    return Webservice()
  }
}
