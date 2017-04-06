//
//  AboutViewController.swift
//  animate_buttons
//
//  Created by Wan Kim Mok on 4/6/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //add a label to view
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.text = "This view is to animate a pop up hearts, you click on the image."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray
        label.sizeToFit()
        label.center = self.view.center
        label.center.x = self.view.center.x
        label.center.y = self.view.center.y
        
        //add a return button at bottom of view
        let returnMainButton = UIButton(frame: CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height-50, width: 150, height: 25))
        returnMainButton.backgroundColor = UIColor.brown
        returnMainButton.titleLabel?.textColor = UIColor.black
        returnMainButton.setTitle("Return to main", for: .normal)
        returnMainButton.addTarget(self, action: #selector(back_to_main), for: .touchUpInside)
        returnMainButton.center.x = self.view.center.x
        
        self.view.addSubview(returnMainButton)
        self.view.addSubview(label)
    }

    func back_to_main(sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
