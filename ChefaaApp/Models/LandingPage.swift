//
//  landingPage.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

struct LandingPage: Decodable, SectionItemPresentable {
    
    let image: String?
    let isActive: Int
    
}

extension LandingPage {
    
    var active: Bool {
        return isActive > 0
    }
    
}
