import UIKit

class BestSellingCell: HomePageItemCell {
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = CGSize(width: (collectionView.frame.width*0.5)-8, height: collectionView.frame.height-8)
        layout.itemSize = size
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = flowLayout
    }
    
}

extension BestSellingCell {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SellItemCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? SellItemCollectionViewCell, let sectionItem = homePageSectionViewModel?.sectionItem(at: indexPath.row){
            cell.configure(sectionItem: sectionItem)
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.inputGray.cgColor
            cell.layer.cornerRadius = 5
            cell.layer.masksToBounds = true
        }
        return cell
    }
    
}
