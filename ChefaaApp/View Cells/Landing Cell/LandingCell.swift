import UIKit

class LandingCell: HomePageItemCell {
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = CGSize(width: collectionView.frame.width*0.4, height: collectionView.frame.height)
        layout.itemSize = size
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = flowLayout
    }
    
}

extension LandingCell {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? ImagesCollectionViewCell, let sectionItem = homePageSectionViewModel?.sectionItem(at: indexPath.row){
            cell.configure(sectionItem: sectionItem)        }
        return cell
    }
    
}
