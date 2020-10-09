//
//  SliderViewModel.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import ImageSlideshow

struct SliderViewModel {
    
    private let sliderObjects: [SliderObject]
    
    init(sliderObjects: [SliderObject]) {
        self.sliderObjects = sliderObjects
    }
    
    var sliderImagesURLs: [String] {
        return sliderObjects.map() { "\(ChefaaStore.baseURL)/\($0.image)" }
    }
    
    var inputSources: [InputSource]? {
        sliderImagesURLs.map() { KingfisherSource(urlString: $0) } as? [InputSource]
    }
    
}
