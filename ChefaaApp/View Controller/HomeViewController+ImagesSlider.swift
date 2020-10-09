import ImageSlideshow

extension HomeTableViewController {
    
    func setupImageSlideshow(imageSlideshow: ImageSlideshow) {
        imageSlideshow.contentScaleMode = .scaleAspectFill
        imageSlideshow.slideshowInterval = 3
        imageSlideshow.backgroundColor = .init(hex: "F4F4F4")
        imageSlideshow.activityIndicator = DefaultActivityIndicator()
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .chefaaGreen
        pageIndicator.pageIndicatorTintColor = .white
        imageSlideshow.pageIndicator = pageIndicator
        imageSlideshow.layer.cornerRadius = 5
        imageSlideshow.layer.masksToBounds = true
    }

}
