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
    
    var result : NSDictionary = NSDictionary()
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func selectPhotoButton(_ sender: AnyObject) {
        //set an alertcontroller
        let alert = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        
        //include photolib action in alert
        let photolib = UIAlertAction(title: "Photo Library", style: .default) { (action) in
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
        if (UIImagePickerController.availableMediaTypes(for: .photoLibrary) != nil){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            print("cant go to photolibrary")
        }
    }
    
    func cameraTapped(){
        if (UIImagePickerController.availableMediaTypes(for: .camera) != nil){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
          print("cant take pictures")
        }
    }
    


    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //save the selected image to imageView
        imageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        imageView.contentMode = .scaleAspectFit
        
        getTags()
        
        //dismiss the view
        dismiss(animated: true, completion: nil)
        
        
    }
    

    
    var tags : NSArray = []
    var probs: NSArray = []
    
    func updateLabel(){
        resultLabel.text = ""
        for i in self.tags{
            resultLabel.text?.append(String(describing: i) + ", ")
        }
    }
    
    func setup(){
        let results = (self.result["results"] as! NSArray)[0]
        let result = (results as! NSDictionary)["result"]
        let tag = ((result as! NSDictionary)["tag"] as! NSDictionary)["classes"] as! NSArray
        
        let probs = ((result as! NSDictionary)["tag"] as! NSDictionary)["probs"] as! NSArray
        
        self.tags = tag
        self.probs = probs
    }
    
    
    func getTags(){
        resultLabel.text = ""
        
        let tagURL = "https://api.clarifai.com/v1/tag/"
        let header = "Bearer " + self.accessToken
        
        let url = URL(string: tagURL)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue(header, forHTTPHeaderField: "Authorization")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.3)//UIImageJPEGRepresentation(imageView.image!, 0.8)
        let base64String = imageData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    

        request.httpBody = ("encoded_data=\(encodeURIComponent(text: base64String!))").data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if ((response as! HTTPURLResponse).statusCode == 200){
                print("success!")
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                    DispatchQueue.main.async {
                        self.result = json
                        print(json)
                        self.setup()
                        self.updateLabel()
                        
                        
                    }
                }catch{
                    
                }
            }
        }
        task.resume()
        
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
    
    func encodeURIComponent(text: String) -> String {
        let characterSet = NSMutableCharacterSet.alphanumeric()
        characterSet.addCharacters(in: "-_.!~*'()")
        
        return text.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)!
    }
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectButtonLabel.layer.cornerRadius = 2
        selectButtonLabel.layer.borderWidth = 0.1
        
        resultLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        resultLabel.numberOfLines = 0
        
//        getAccessToken()
        self.accessToken = getVal(key: "access_token")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

