import UIKit
import ImageSlideshow

class ImagesSliderCell: UITableViewCell {

    @IBOutlet weak var imagesSlider: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {
        imagesSlider.contentScaleMode = .scaleAspectFill
        imagesSlider.slideshowInterval = 3
        imagesSlider.backgroundColor = .init(hex: "F4F4F4")
        imagesSlider.activityIndicator = DefaultActivityIndicator()
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .chefaaGreen
        pageIndicator.pageIndicatorTintColor = .white
        imagesSlider.pageIndicator = pageIndicator
        imagesSlider.layer.cornerRadius = 5
        imagesSlider.layer.masksToBounds = true
    }

    func configure(viewModel: SliderViewModel) {
        imagesSlider.setImageInputs(viewModel.inputSources)
    }
    
}
