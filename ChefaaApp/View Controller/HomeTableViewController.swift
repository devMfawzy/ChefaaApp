import UIKit
import ImageSlideshow
import RxSwift

class HomeTableViewController: UITableViewController, HomeViewSetuping {

    @IBOutlet weak var imageSlideshow: ImageSlideshow!
    
    var homeTableViewViewModel: HomeTableViewViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableViewViewModel = HomeTableViewViewModel(chefaaService: ChefaaStore.shared)
        guard let viewModel = self.homeTableViewViewModel else {
            return
        }
        viewModel.homePage.drive(onNext: { [weak self] (_) in
            if let inputSources = viewModel.sliderViewModel?.inputSources {
                self?.imageSlideshow.setImageInputs(inputSources)
            }
        }).disposed(by: disposeBag)
        setupImageSlideshow(imageSlideshow: imageSlideshow)
    }

}
