//
//  Bestselling.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

struct Bestselling: Decodable {
    let id: Int
    let title: String?
    let titleEn: String
    let titleAr: String
    let isFavorite: Bool
    let couponDescription: String?
    let discount: Int?
    let description: String
    let price: Int
    let finalDiscount: Int
    let images: [String]?
}
