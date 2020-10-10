import UIKit

class BrandsCell: HomePageItemCell {
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = collectionView.frame.width*0.3
        let size = CGSize(width: width, height: width*0.8)
        layout.itemSize = size
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = flowLayout
    }
    
}

extension BrandsCell {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? ImagesCollectionViewCell, let sectionItem = homePageSectionViewModel?.sectionItem(at: indexPath.row){
            cell.configure(sectionItem: sectionItem)
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.inputGray.cgColor
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = true
        }
        return cell
    }
    
}
