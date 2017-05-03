//
//  ViewController.swift
//  scan_and_share_poem
//
//  Created by Wan Kim Mok on 5/1/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController {

    
    @IBOutlet var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.isEditable = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func UploadPhoto(_ sender: Any) {
        let photoPickerActionSheet = UIAlertController(title: "Snap/Upload Photo", message: nil, preferredStyle: .actionSheet)
        
        //check if there's a camera, if so add that to photoPickerActionSheet
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraButton = UIAlertAction(title: "Take a photo", style: .default, handler: { (alert) in
                let photoPicker = UIImagePickerController()
                photoPicker.sourceType = .camera
                self.present(photoPicker, animated: true, completion: nil)
            })
            
            photoPickerActionSheet.addAction(cameraButton)
            
        }
        
        //add photolibrary to photoPickerActionSheet
        let libraryButton = UIAlertAction(title: "Choose Existing", style: .default) { (alert) in
            let photoPicker = UIImagePickerController()
            photoPicker.sourceType = .photoLibrary
            self.present(photoPicker, animated: true, completion: nil)
        }

        photoPickerActionSheet.addAction(libraryButton)
        
        //add cancel to actionsheet
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        photoPickerActionSheet.addAction(cancelButton)
        
        //present view controller
        self.present(photoPickerActionSheet, animated: true, completion: nil)

        
    }
    
    

}


