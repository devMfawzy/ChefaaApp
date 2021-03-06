import RxSwift
import RxCocoa

class HomeTableViewViewModel {

    private let chefaaService: ChefaaService
    private let disposeBag = DisposeBag()
    
    private let homePageSubject = BehaviorRelay<HomePage?>(value: nil)
    private let isFetchingSubject = BehaviorRelay<Bool>(value: false)
    private let errorSubject = BehaviorRelay<String?>(value: nil)
    
    init(chefaaService: ChefaaService) {
        self.chefaaService = chefaaService
        self.fetchHomePage()
    }
    
    func fetchHomePage() {
        self.homePageSubject.accept(nil)
        self.isFetchingSubject.accept(true)
        self.errorSubject.accept(nil)
        chefaaService.fetchHomePage(language: .en) { [weak self] (result) in
            switch result {
            case .success(let response):
                let homePage = response.data
                self?.homePageSubject.accept(homePage)
            case .failure(let error):
                self?.errorSubject.accept(error.localizedDescription)
            }
            self?.isFetchingSubject.accept(false)
        }
    }
    
    var homePage: Driver<HomePage?> {
        return homePageSubject.asDriver()
    }
    
    var isFetching: Driver<Bool> {
        return isFetchingSubject.asDriver()
    }
    
    var error: Driver<String?> {
       return errorSubject.asDriver()
    }
    
    var hasError: Bool {
       return errorSubject.value != nil
    }
    
    var sliderViewModel: SliderViewModel? {
        guard let slider = homePageSubject.value?.slider else {
            return nil
        }
        return SliderViewModel(sliderObjects: slider)
    }
    
    var landingPageViewModel: HomePageSectionViewModel? {
        guard let homePage = homePageSubject.value else {
            return nil
        }
        let landingPages = homePage.landingPages
        let landingPageTitle = homePage.landingPageTitle
        return HomePageSectionViewModel(sectionItems: landingPages, headlineText: landingPageTitle ?? "")
    }
    
    var categoriesViewModel: HomePageSectionViewModel? {
        guard let homePage = homePageSubject.value else {
            return nil
        }
        let subCategories = homePage.subCategories
        let headlineText = "All Categories"
        return HomePageSectionViewModel(sectionItems: subCategories, headlineText: headlineText)
    }
    
    var brandsViewModel: HomePageSectionViewModel? {
        guard let homePage = homePageSubject.value else {
            return nil
        }
        let brands = homePage.brands
        let headlineText = "Brands"
        return HomePageSectionViewModel(sectionItems: brands, headlineText: headlineText)
    }
    
    var bestSellingViewModel: HomePageSectionViewModel? {
        guard let homePage = homePageSubject.value else {
            return nil
        }
        let bestSellingViewModel = homePage.bestselling.map() { BestSellingViewModel(bestSelling: $0) }
        let headlineText = "Best Selling"
        return HomePageSectionViewModel(sectionItems: bestSellingViewModel, headlineText: headlineText)
    }

}
