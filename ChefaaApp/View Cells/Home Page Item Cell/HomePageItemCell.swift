import UIKit

class HomePageItemCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    open var homePageSectionViewModel: HomePageSectionViewModel?
    
    func configure(viewModel: HomePageSectionViewModel) {
        homePageSectionViewModel = viewModel
        headlineLabel.text = viewModel.headlineText
        collectionView.dataSource = self
        collectionView.reloadData()
    }

}

extension HomePageItemCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageSectionViewModel?.itemsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
