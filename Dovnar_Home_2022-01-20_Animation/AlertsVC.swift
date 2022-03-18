//
//  AlertsVC.swift
//  Dovnar_Home_2022-01-20_Animation
//
//  Created by Anton Dovnar on 23.01.22.
//

import UIKit

class AlertsVC: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func didTapView(_: UITapGestureRecognizer) {
    
        let alert = UIAlertController(title: "Choose source", message: "Select what you want", preferredStyle: .actionSheet)
        
        let openGalleryButton  = UIAlertAction(title: "Open Gallery", style: .default) { action in
            let picker = UIImagePickerController()
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
        alert.addAction(openGalleryButton)
        
        let cancelButton  = UIAlertAction(title: "Cancel", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func didLongTapView(_: UILongPressGestureRecognizer) {
        
        if myImageView.image != nil {
       
        let alert = UIAlertController(title: "Remove", message: "Do you want to remove", preferredStyle: .alert)
        
        let cancelButton  = UIAlertAction(title: "Cancel", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelButton)
        
        let removeButton  = UIAlertAction(title: "Remove", style: .destructive) { action in
            self.myImageView.image = nil
        }
        alert.addAction(removeButton)
        
        present(alert, animated: true, completion: nil)
         
        } else {
            let alert = UIAlertController(title: "Error", message: "There is no image to remove!", preferredStyle: .alert)
            
            let oklButton  = UIAlertAction(title: "Ok", style: .default) { action in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(oklButton)
    
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension AlertsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        myImageView.image = info[.originalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    
  }
}
