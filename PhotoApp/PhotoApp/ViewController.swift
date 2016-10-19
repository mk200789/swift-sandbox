//
//  ViewController.swift
//  PhotoApp
//
//  Created by Wan Kim Mok on 10/18/16.
//  Copyright © 2016 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var selectButtonLabel: UIButton!
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    var accessToken : String = ""
    
    var imageURL : String = ""
    
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
            self.cameraTapped()
        }
        
        alert.addAction(camera)
        
        //include cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    func photoLibTapped(){
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func cameraTapped(){
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //save the selected image to imageView
        imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        imageView.contentMode = .scaleAspectFit
        
        let url = info[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName = url.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
        let path = documentDirectory.appending(imageName!)
        print(path)
        
        self.imageURL = path

        
        //dismiss the view
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func getTags(){
        
    }
    
    
    func getAccessToken(){
        let clientID = getVal(key: "client_id")
        let clientSecret = getVal(key: "client_secret")
        let authURL = "https://api.clarifai.com/v1/token"
        
        
        let params = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=client_credentials"
        let url = URL(string: authURL)
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"

        request.httpBody = params.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if ((response as! HTTPURLResponse).statusCode == 200){
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    DispatchQueue.main.async {
                        self.accessToken = setVal(key: "access_token", value: json["access_token"] as! String)
                        setVal(key: "expires_in", value: String(describing: json["expires_in"]))
                        
                    }
                }catch{
                    
                }
            }
        }
        task.resume()


        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectButtonLabel.layer.cornerRadius = 2
        selectButtonLabel.layer.borderWidth = 0.1
        
        getAccessToken()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

