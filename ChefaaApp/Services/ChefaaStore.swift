//
//  ChefaaStore.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

class ChefaaStore: ChefaaService {
    
    static let baseURL = "https://test.eldev.tech"

    public static let shared = ChefaaStore()
    private init() {}
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func fetchHomePage(language: Language = .en, completion: @escaping (Result<HomePageResponse, Error>) -> Void) {
        guard let url = URL(string: "\(ChefaaStore.baseURL)/\(Endpoint.homePage.rawValue)") else {
            handleFailure(completion, error: ServiceError.invalidEndpoint)
            return
        }
        var request = URLRequest(url: url)
        request.setValue(language.rawValue, forHTTPHeaderField: Language.headerKey)
        urlSession.dataTask(with: request) { [weak self] (data, response, error) in
            if error != nil {
                self?.handleFailure(completion, error: ServiceError.apiError)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self?.handleFailure(completion, error: ServiceError.invalidResponse)
                return
            }
            guard let data = data else {
                self?.handleFailure(completion, error: ServiceError.noData)
                return
            }
            if let homePageResponse = try? self?.jsonDecoder.decode(HomePageResponse.self, from: data) {
                self?.handleSuccess(completion, response: homePageResponse)
            } else {
                self?.handleFailure(completion, error: ServiceError.serializationError)
            }
        }.resume()
    }
    
    private func handleFailure(_ completion: @escaping (Result<HomePageResponse, Error>) -> Void, error: Error) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
    
    private func handleSuccess(_ completion: @escaping (Result<HomePageResponse, Error>) -> Void, response: HomePageResponse) {
        DispatchQueue.main.async {
            completion(.success(response))
        }
    }
    
}
