//
//  ViewController.swift
//  animate_buttons
//
//  Created by Wan Kim Mok on 4/5/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toggle_Button = false
    
    var button1 : UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //add initial button to view
        var image = UIImage(named: "star")
        image = image?.withRenderingMode(.alwaysOriginal)
        let starButton = UIButton(frame: CGRect(x: 50, y: 50, width: (image?.size.width)!, height: (image?.size.height)!))
        starButton.setImage(image, for: .normal)
        starButton.addTarget(self, action: #selector(expand_buttons), for: UIControlEvents.touchUpInside)
        prepare_hidden_buttons(main_button: starButton)
        self.view.addSubview(starButton)
        
        //add a label to view
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.text = "This view is to animate exposed hidden 'About' button."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.sizeToFit()
        label.center = self.view.center
        label.center.x = self.view.center.x
        label.center.y = self.view.center.y
        
        self.view.addSubview(label)
        
        
        
        
    }
    
    func prepare_hidden_buttons(main_button: UIButton){
        print("expose_hidden_buttons")
        button1 = UIButton(frame: CGRect(x: CGFloat(main_button.frame.origin.x), y: CGFloat(main_button.frame.origin.y) , width: 50, height: 50))
        button1.backgroundColor = UIColor.blue
        button1.setTitle("About!", for: .normal)
        button1.isHidden = true
        button1.layer.cornerRadius = 0.5*button1.bounds.size.width
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)
        button1.addTarget(self, action: #selector(about), for: .touchUpInside)
        self.view.addSubview(button1)
    }
    
    func about(sender: UIButton){
        print("About button clicked!")
    }
    
    func expose_hidden_buttons(){
        
        if toggle_Button == false{
            print("expose_hidden_buttons")
            self.button1.alpha = 0.1
            toggle_Button = true
            button1.isHidden = false

            UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
                self.button1.alpha = 0.8
                self.button1.frame = CGRect(x: CGFloat(self.button1.frame.origin.x)+80.0, y: CGFloat(self.button1.frame.origin.y)+80.0, width: self.button1.frame.size.width, height: self.button1.frame.size.height)
                self.button1.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { (true) in
                self.button1.alpha = 1.0
            }
        }else{
            print("hide_hidden_buttons")
            toggle_Button = false
            self.button1.alpha = 0.8
            UIView.animate(withDuration: 1.6, delay: 0.0, options: .curveEaseIn ,animations: {
                self.button1.alpha = 0.4
                self.button1.frame = CGRect(x: CGFloat(self.button1.frame.origin.x)-80.0, y: CGFloat(self.button1.frame.origin.y)-80.0, width: self.button1.frame.size.width, height: self.button1.frame.size.height)
                self.button1.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (true) in
                self.button1.isHidden = true
                self.button1.alpha = 0.1
            })

        }
        
        
        
        
    }
    
    func expand_buttons(sender: UIButton){
        print("button touched")
        expose_hidden_buttons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

