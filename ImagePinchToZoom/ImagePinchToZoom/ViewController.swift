//
//  ViewController.swift
//  ImagePinchToZoom
//
//  Created by Nelson Gonzalez on 3/28/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var selectedImage: UIImage?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedImage = imageView.image
        
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toNextScreen))
        imageView.addGestureRecognizer(tapGesture)
        
        
    }
    

    @objc func toNextScreen() {
       self.performSegue(withIdentifier: "toThirdVC", sender: self)
    }
   
    // MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toScrollView" {
            let destinationVC = segue.destination as? ScrollViewController
            destinationVC?.imageView = UIImageView(image: self.selectedImage)
            guard let text = textLabel.text, !text.isEmpty else {return}
            destinationVC?.text = text
        } else if segue.identifier == "toThirdVC" {
            let destinationVC = segue.destination as? ThirdViewController
            
           // destinationVC?.photoName = "photo1"
            destinationVC?.photo = imageView
          
        }
     
    }
    

}
