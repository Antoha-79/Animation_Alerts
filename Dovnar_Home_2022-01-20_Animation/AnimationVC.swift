//
//  AnimationVC.swift
//  Dovnar_Home_2022-01-20_Animation
//
//  Created by Anton Dovnar on 23.01.22.
//

import UIKit

class AnimationVC: UIViewController {
    
    @IBOutlet private weak var myImage: UIImageView!


    
    @IBAction func didPanView(recogniser: UIPanGestureRecognizer) {
       let moving = recogniser.translation(in: self.view)
        if let myImageView = recogniser.view {
            myImageView.center = CGPoint(x: myImageView.center.x + moving.x, y: myImageView.center.y + moving.y)
        }
        recogniser.setTranslation(CGPoint.zero, in: self.view)
        
    }
 
    @IBAction func didPinchView(recogniser: UIPinchGestureRecognizer) {
        guard let pinchedView = recogniser.view else { return }
        let newWidth = pinchedView.bounds.width * recogniser.scale
        let newHeight = pinchedView.bounds.height * recogniser.scale
        
        pinchedView.bounds.size.width = max(min(newWidth, 800.0), 70.0)
        pinchedView.bounds.size.height = max(min(newHeight, 500.0), 30.0)
        
        pinchedView.center = view.center
        recogniser.scale = 1
    }
    
    
    @IBAction func didRotationView(recogniser: UIRotationGestureRecognizer) {
        guard let rotatedView = recogniser.view else { return }
            rotatedView.transform = CGAffineTransform(rotationAngle: recogniser.rotation)
    }
    
    @IBAction func didTapView(recogniser: UITapGestureRecognizer) {
        
        // не нашел как сделать констрейнты (через Outlet констрейнтов)
            let startPosition = UIImageView()
            startPosition.frame = CGRect(x: 20.0, y: 361.0, width: 374.0, height: 174.0)
        
            let verticalPosition = UIImageView()
            verticalPosition.frame = CGRect(x: 20.0, y: 50.0, width: 374.0, height: 803.9)
        
        guard let tappedView = recogniser.view else { return }
        let radians = atan2(tappedView.transform.b, tappedView.transform.a)
       
        if radians == 0 {
            tappedView.transform = self.view.transform.rotated(by: .pi/2)
            tappedView.frame = verticalPosition.frame
        }
        
         if radians == .pi/2 {
             tappedView.transform = self.view.transform.rotated(by: 0)
             tappedView.frame = startPosition.frame
         }
        
        
        UIView.animate(withDuration: 1.5) {
            if radians > 0 && radians != .pi/2  {
                tappedView.transform = self.view.transform.rotated(by: .pi/2)
                tappedView.frame = verticalPosition.frame
            } else if radians != 0  {
                tappedView.transform = self.view.transform.rotated(by: 0)
                tappedView.frame = startPosition.frame
            }
        }
    /*
        UIView.animate(withDuration: 1.5) {
            if radians >= 0 && radians != .pi/2  {
                tappedView.transform = self.view.transform.rotated(by: .pi/2)
                tappedView.frame = verticalPosition.frame
            } else if radians == .pi/2 {
                tappedView.transform = self.view.transform.rotated(by: 0)
                tappedView.frame = startPosition.frame
            } else {
                tappedView.transform = self.view.transform.rotated(by: 0)
                tappedView.frame = startPosition.frame
            }
        }
    */
        
    }
    
  
    
    @IBAction func didLongTapView(recogniser: UILongPressGestureRecognizer) {
        
            let startPosition = UIImageView()
            startPosition.frame = CGRect(x: 20.0, y: 361.0, width: 374.0, height: 174.0)
        
            guard let tappedView = recogniser.view else { return }
            
            tappedView.transform = self.view.transform.rotated(by: 0)
            tappedView.frame = startPosition.frame
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
