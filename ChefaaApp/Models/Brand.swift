//
//  Brand.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

struct Brand: Decodable {
    let images: [String]?
    let title: String
}

extension Brand: SectionItemPresentable {
    
    var image: String? {
        return images?.first
    }
    
}
