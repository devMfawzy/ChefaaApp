//
//  Protocols.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

protocol ChefaaService {
    func fetchHomePage(language: Language, completion: @escaping (Result<HomePageResponse, Error>) -> Void)
}
