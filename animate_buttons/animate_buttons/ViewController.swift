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
        
        var image = UIImage(named: "star")
        image = image?.withRenderingMode(.alwaysOriginal)
        let starButton = UIButton(frame: CGRect(x: 50, y: 50, width: (image?.size.width)!, height: (image?.size.height)!))
        starButton.setImage(image, for: .normal)
        starButton.addTarget(self, action: #selector(expand_buttons), for: UIControlEvents.touchUpInside)
        
        prepare_hidden_buttons(main_button: starButton)
        self.view.addSubview(starButton)
        
    }
    
    func prepare_hidden_buttons(main_button: UIButton){
        print("expose_hidden_buttons")
        button1 = UIButton(frame: CGRect(x: CGFloat(main_button.frame.origin.x), y: CGFloat(main_button.frame.origin.y) , width: 100, height: 25))
        button1.backgroundColor = UIColor.blue
        button1.setTitle("Exposed!", for: .normal)
        button1.isHidden = true
        self.view.addSubview(button1)
    }
    
    func expose_hidden_buttons(){
        print("expose_hidden_buttons")
        if toggle_Button == false{
            toggle_Button = true
            button1.isHidden = false
            UIView.animate(withDuration: 2.0, animations: {
                self.button1.frame = CGRect(x: CGFloat(self.button1.frame.origin.x)+80.0, y: CGFloat(self.button1.frame.origin.y)+80.0, width: self.button1.frame.size.width, height: self.button1.frame.size.height)
                })
        }else{
            
            toggle_Button = false
            UIView.animate(withDuration: 2.0, animations: {
                self.button1.frame = CGRect(x: CGFloat(self.button1.frame.origin.x)-80.0, y: CGFloat(self.button1.frame.origin.y)-80.0, width: self.button1.frame.size.width, height: self.button1.frame.size.height)
            }, completion: { (true) in
                self.button1.isHidden = true
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

