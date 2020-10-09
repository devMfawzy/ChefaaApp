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
    let title: String
    let titleEn: String
    let titleAr: String
    let isFavorite: Bool
    let fullUrl: String
    let quantity: Int
    let couponDescription: String?
    let couponDescriptionAr: String?
    let discount: Int?
    let description: String
    let descriptionAr: String
    let descriptionEn: String
    let subCategoryId: Int
    let price: Int
    let finalDiscount: Int
    let images: [String]?
}
