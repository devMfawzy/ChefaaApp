//
//  HomePage_.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

struct HomePage: Decodable {
    let slider: [SliderObject]
    let subCategories: [SubCategory]
    let brands: [Brand]
    let bestselling: [Bestselling]
}
