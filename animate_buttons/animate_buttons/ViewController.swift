//
//  ViewController.swift
//  animate_buttons
//
//  Created by Wan Kim Mok on 4/5/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var image = UIImage(named: "star")
        image = image?.withRenderingMode(.alwaysOriginal)
        let starButton = UIButton(frame: CGRect(x: 50, y: 50, width: (image?.size.width)!, height: (image?.size.height)!))
        starButton.setImage(image, for: .normal)
        starButton.addTarget(self, action: #selector(test), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(starButton)
        
    }
    
    func test(sender: UIButton){
        print("button touched")
        UIView.animate(withDuration: 2.0, animations: {
            sender.frame = CGRect(x: CGFloat(sender.frame.origin.x)+20.0, y: CGFloat(sender.frame.origin.y)+20.0, width: sender.frame.size.width, height: sender.frame.size.height)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

