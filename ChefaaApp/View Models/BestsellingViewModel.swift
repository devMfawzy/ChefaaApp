import Foundation

struct BestSellingViewModel: SectionItemPresentable {
    
    let bestSelling: Bestselling
    
    init(bestSelling: Bestselling) {
        self.bestSelling = bestSelling
    }
    
    var title: String? {
        return bestSelling.title
    }
    
    var newPrice: String? {
        return "\(bestSelling.finalDiscount) EGP"
    }
    
    var oldPrice: String? {
        return "\(bestSelling.price) EGP"
    }
    
    var image: String? {
        return bestSelling.images?.first
    }
    
    var couponText: String? {
        return bestSelling.couponDescription
    }
    
}
