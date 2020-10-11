import UIKit
import RxSwift

class HomeViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var retryButton: UIButton!
    
    private var homeTableViewController: HomeTableViewController!
    private let disposeBag = DisposeBag()
    var homeTableViewViewModel: HomeTableViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableViewViewModel = HomeTableViewViewModel(chefaaService: ChefaaStore.shared)
        guard let viewModel = self.homeTableViewViewModel else {
            return
        }
        viewModel.homePage.drive(onNext: { [weak self] (HomePage) in
            self?.homeTableViewController?.setupView(homeTableViewViewModel: viewModel)
            self?.homeTableViewController.view.isHidden = HomePage == nil
        }).disposed(by: disposeBag)
        viewModel.isFetching.drive(activityIndicator.rx.isAnimating).disposed(by: disposeBag)
        viewModel.isFetching.drive(retryButton.rx.isHidden).disposed(by: disposeBag)
        viewModel.error.drive(onNext: {[weak self] (error) in
            let hasError = self?.homeTableViewViewModel?.hasError ?? false
            self?.errorLabel.isHidden = !hasError
            self?.retryButton.isHidden = !hasError
            self?.errorLabel.text = error
        }).disposed(by: disposeBag)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        searchBar.setTextFieldBackgroundColor(.white)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.homeTableViewController = segue.destination as? HomeTableViewController
    }

    @IBAction func didClickRetryButton(_ sender: Any) {
        homeTableViewViewModel?.fetchHomePage()
    }
    
}
