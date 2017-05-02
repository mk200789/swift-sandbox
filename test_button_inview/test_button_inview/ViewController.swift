//
//  ViewController.swift
//  test_button_inview
//
//  Created by Wan Kim Mok on 3/23/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var button = UIButton(frame: CGRect(x: 100, y: 100, width: 80, height: 50))
        button.backgroundColor = UIColor.green
        button.setTitle("Hello Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        button = UIButton(frame: CGRect(x: 100, y: 201, width: 80, height: 50))
        button.backgroundColor = UIColor.green
        button.setTitle("Hello Button", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
//        let popupView = UIView()
//        popupView.translatesAutoresizingMaskIntoConstraints = false
//        popupView.backgroundColor = UIColor.purple
//        popupView.layer.cornerRadius = 20
//        popupView.clipsToBounds = true
//        
//        
//        let bottomView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
//        bottomView.translatesAutoresizingMaskIntoConstraints = false
//
//        
//        let singleBtn = UIButton()
//        singleBtn.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 20)
//        singleBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
//        singleBtn.setTitleColor(UIColor.blue, for: UIControlState.highlighted)
//        
//        singleBtn.setTitle("OK", for: UIControlState.normal)
//        singleBtn.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
//        singleBtn.translatesAutoresizingMaskIntoConstraints = false
//        singleBtn.backgroundColor = UIColor.red
//        bottomView.addSubview(singleBtn)
//        
//        bottomView.addConstraint(NSLayoutConstraint(item: singleBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 200))
//        bottomView.addConstraint(NSLayoutConstraint(item: singleBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50))
//        bottomView.addConstraint(NSLayoutConstraint(item: singleBtn, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: bottomView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 100))
//        bottomView.addConstraint(NSLayoutConstraint(item: singleBtn, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: bottomView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 100))
//        
//        self.view.addSubview(bottomView)
        
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        sender.alpha = 0.5
        UIView.animate(withDuration: 0.3, animations: {
            sender.alpha = 1.0
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

