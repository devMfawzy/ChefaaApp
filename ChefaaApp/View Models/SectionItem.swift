import Foundation

protocol SectionItemPresentable {
    var image: String? { get }
    var title: String? { get }
}

extension SectionItemPresentable {
    
    var title: String? {
        return nil
    }
    
    var imagesUrl: URL? {
        guard let image = image else {
            return nil
        }
        return URL(string: "\(ChefaaStore.baseURL)/\(image)")
    }
    
}
