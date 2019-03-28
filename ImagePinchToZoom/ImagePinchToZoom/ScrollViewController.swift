//
//  ScrollViewController.swift
//  ImagePinchToZoom
//
//  Created by Nelson Gonzalez on 3/26/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

 //   @IBOutlet weak var scrollView: UIScrollView!
   // @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        scrollView.maximumZoomScale = 1.0
//        scrollView.maximumZoomScale = 6.0
        
      //  scrollView.delegate = self
        
        textLabel.textColor = .white
        textLabel.text = text

        setUpScrollView()
        setZoomScale(for: scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        centerImage()
        
    
    }
    
    
    func setUpScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
    }
    
    private func setZoomScale(for scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minumumScale = min(widthScale, heightScale)
       
        scrollView.minimumZoomScale = minumumScale
        scrollView.maximumZoomScale = 3.0
    }
    
    private func centerImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width) / 2 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        
        //Account for navigationController space
        let extraSpace: CGFloat
        if navigationController != nil {
            extraSpace = navigationController!.navigationBar.bounds.size.height
        } else {
            extraSpace = 0
        }
        
        scrollView.contentInset = UIEdgeInsets(top: verticalSpace - extraSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.imageView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
    

}
