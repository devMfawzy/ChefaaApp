//
//  LandingPageViewModel.swift
//  ChefaaApp
//
//  Created by Mohamed Fawzy on 10/9/20.
//  Copyright © 2020 fuzzix. All rights reserved.
//

import Foundation

struct HomePageSectionViewModel {
    
    private let sectionItems: [SectionItemPresentable]
    let headlineText: String
    
    init(sectionItems: [SectionItemPresentable], headlineText: String) {
        self.sectionItems = sectionItems
        self.headlineText = headlineText
    }
    
    var itemsCount: Int {
        return sectionItems.count
    }
    
    func sectionItem(at index: Int) -> SectionItemPresentable {
        return sectionItems[index]
    }
    
}
