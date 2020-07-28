//
//  ViewController.swift
//  TestAWSS3
//
//  Created by garlic on 2020/07/20.
//  Copyright © 2020 com.codershigh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImageView: UIImageView!
    
    var uploadedImageFileName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAWSDocumentsDirectory()
        
    }

    @IBAction func selectimage(_ sender: Any) {
        selectImageFromGallery()
        
        self.uploadImageToServer()
    }
    
    func selectImageFromGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(self, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func uploadImageToServer() {
        let imageToUpload:UIImage
        
        if let albumImage = selectedImageView.image {
            imageToUpload = albumImage
        } else {
            guard let localImage = UIImage(named: "recommendedByChairman") else {return}
            imageToUpload = localImage
        }
        
        AWSS3Manager.shared.uploadImage(image: imageToUpload, progress: { [weak self](uploadProgress) in
            guard let strongSelf = self else {return}
        }) { [weak self] (uploadedFileUrl, error) in
            guard let strongSelf = self else {return}
            if let finalPath = uploadedFileUrl as? String {
                strongSelf.uploadedImageFileName = finalPath.fromStringToEnd("user-send-images-list/")
                strongSelf.selectedImageView.image = nil
            }
        }
    }
    
}


