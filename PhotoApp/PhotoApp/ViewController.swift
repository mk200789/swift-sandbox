//
//  ViewController.swift
//  PhotoApp
//
//  Created by Wan Kim Mok on 10/18/16.
//  Copyright © 2016 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func selectPhotoButton(_ sender: AnyObject) {
        //set an alertcontroller
        let alert = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        
        //include photolib action in alert
        let photolib = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            print("photo lib!")
            self.photoLibTapped()
        }
        
        alert.addAction(photolib)
        
        //include camera action in alert
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
        }
        
        alert.addAction(camera)
        
        //include cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alert.addAction(cancel)
        
        
        self.present(alert, animated: true){
            
        }
    }
    
    func photoLibTapped(){
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //save the selected image to imageView
        imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        imageView.contentMode = .scaleAspectFit
        
        //dismiss the view
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

