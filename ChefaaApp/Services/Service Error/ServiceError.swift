//
//  ServiceError.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

public enum ServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
