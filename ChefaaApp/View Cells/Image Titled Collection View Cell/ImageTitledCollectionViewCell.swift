import UIKit
import Kingfisher

class ImageTitledCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.cornerRadius = 20
        self.imageView.layer.masksToBounds = true
    }
    
    func configure(sectionItem: SectionItemPresentable) {
        imageView.kf.setImage(with: sectionItem.imagesUrl)
        titleLabel.text = sectionItem.title
    }
    
}
