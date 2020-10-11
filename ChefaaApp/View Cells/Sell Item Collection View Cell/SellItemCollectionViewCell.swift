import UIKit

class SellItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var couponView: UIView!
    @IBOutlet weak var couponLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.contentMode = .scaleAspectFill
        [self.couponView, self.addToCartButton].forEach() { $0.layer.cornerRadius = 5 }
        self.addToCartButton.layer.masksToBounds = true
    }
    
    func configure(sectionItem: SectionItemPresentable) {
        imageView.kf.setImage(with: sectionItem.imagesUrl)
        titleLabel.text = sectionItem.title
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: sectionItem.oldPrice ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        oldPriceLabel.attributedText = attributeString
        priceLabel.text = sectionItem.newPrice
        couponView.isHidden = sectionItem.couponText == nil
        if let couponDescription = sectionItem.couponText {
            couponLabel.text = couponDescription
        }
    }
    
}
