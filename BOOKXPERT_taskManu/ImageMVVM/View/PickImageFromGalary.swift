//
//  PickImageFromGalary.swift
//  BOOKXPERT_taskManu
//
//  Created by Aritipamula Kotaiah on 06/04/25.
//

import UIKit

class PickImageFromGalary: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var galare: UIButton!
    private let viewModel = ImagePickerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "image-4")
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.backgroundColor = UIColor.systemGray6.cgColor
        galare.layer.cornerRadius = 15
        
        viewModel.selectedImage = { [weak self] image in
            self?.imageView.image = image
            
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func galareyButton(_ sender: Any) {
        
//        viewModel.openGallery(from: self)
        let Alert = UIAlertController(title: "Choose", message: "Select the media type", preferredStyle: .actionSheet)
        let Gallery = UIAlertAction(title: "Gallery", style: .default) {
            UIAlertAction in
           
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .photoLibrary
            image.allowsEditing = true
            self.present(image, animated: true)
            
        }
        
        let Camera = UIAlertAction(title: "Camera", style: .default) {
            UIAlertAction in
          
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = .camera
            image.allowsEditing = true
            self.present(image, animated: true)
        
            }
        let Cancel = UIAlertAction(title: "Cancel", style: .destructive)
    
        Alert.addAction(Gallery)
        Alert.addAction(Camera)
        Alert.addAction(Cancel)
        self.present(Alert, animated: true, completion: nil)
    }
}

extension PickImageFromGalary: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = editedImage
            self.imageView.image = selectedImage
            picker.dismiss(animated: true)
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = originalImage
            self.imageView.image = originalImage
            picker.dismiss(animated: true)
        }else{
            print("ERROR")
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        return dismiss(animated: true, completion: nil)
    }
}
