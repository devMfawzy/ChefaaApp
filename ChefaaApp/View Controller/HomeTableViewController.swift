import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var imagesSliderCell: ImagesSliderCell!
    @IBOutlet weak var landingPagesCell: LandingCell!
    @IBOutlet weak var categoriesCell: CategoriesCollectionViewCell!
    @IBOutlet weak var brandsCell: LandingCell!
    @IBOutlet weak var bestSellingCell: BestSellingCell!
    
    func setupView(homeTableViewViewModel: HomeTableViewViewModel) {
        if let sliderViewModel = homeTableViewViewModel.sliderViewModel {
            self.imagesSliderCell.configure(viewModel: sliderViewModel)
        }
        if let landingPageViewModel = homeTableViewViewModel.landingPageViewModel {
            self.landingPagesCell.configure(viewModel: landingPageViewModel)
        }
        if let categoriesViewModel = homeTableViewViewModel.categoriesViewModel {
            self.categoriesCell.configure(viewModel: categoriesViewModel)
        }
        if let brandsViewModel = homeTableViewViewModel.brandsViewModel {
            self.brandsCell.configure(viewModel: brandsViewModel)
        }
        if let bestSellingViewModel = homeTableViewViewModel.bestSellingViewModel {
            self.bestSellingCell.configure(viewModel: bestSellingViewModel)
        }
    }

}
