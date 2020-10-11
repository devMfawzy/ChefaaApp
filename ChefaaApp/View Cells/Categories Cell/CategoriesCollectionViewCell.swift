import UIKit

class CategoriesCollectionViewCell: HomePageItemCell {

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let size = CGSize(width: collectionView.frame.width/7, height: collectionView.frame.height/2.1 )
        layout.itemSize = size
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = flowLayout
    }
    
}

extension CategoriesCollectionViewCell {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageTitledCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? ImageTitledCollectionViewCell, let sectionItem = homePageSectionViewModel?.sectionItem(at: indexPath.row) {
            cell.configure(sectionItem: sectionItem)
        }
        return cell
    }
    
}
