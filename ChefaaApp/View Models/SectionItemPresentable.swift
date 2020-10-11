import Foundation

protocol SectionItemPresentable {
    var image: String? { get }
    var title: String? { get }
    var newPrice: String? { get }
    var oldPrice: String? { get }
    var couponText: String? { get }
}

extension SectionItemPresentable {
    
    var title: String? {
        return nil
    }
    
    var newPrice: String? {
        return nil
    }
    
    var oldPrice: String? {
        return nil
    }
    
    var couponText: String? {
        return nil
    }

    var imagesUrl: URL? {
        guard let image = image else {
            return nil
        }
        return URL(string: "\(ChefaaStore.baseURL)/\(image)")
    }
    
}
