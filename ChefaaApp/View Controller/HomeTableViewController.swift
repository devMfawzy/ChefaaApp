import UIKit
import RxSwift

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var imagesSliderCell: ImagesSliderCell!
    @IBOutlet weak var landingPagesCell: LandingCell!
    @IBOutlet weak var categoriesCell: CategoriesCollectionViewCell!
    @IBOutlet weak var brandsCell: LandingCell!
    
    var homeTableViewViewModel: HomeTableViewViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableViewViewModel = HomeTableViewViewModel(chefaaService: ChefaaStore.shared)
        guard let viewModel = self.homeTableViewViewModel else {
            return
        }
        viewModel.homePage.drive(onNext: { [weak self] (_) in
            if let sliderViewModel = viewModel.sliderViewModel {
                self?.imagesSliderCell.configure(viewModel: sliderViewModel)
            }
            if let landingPageViewModel = viewModel.landingPageViewModel {
                self?.landingPagesCell.configure(viewModel: landingPageViewModel)
            }
            if let categoriesViewModel = viewModel.categoriesViewModel {
                self?.categoriesCell.configure(viewModel: categoriesViewModel)
            }
            if let brandsViewModel = viewModel.brandsViewModel {
                self?.brandsCell.configure(viewModel: brandsViewModel)
            }
        }).disposed(by: disposeBag)
    }

}
