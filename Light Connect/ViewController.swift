//
//  ViewController.swift
//  Light Connect
//
//  Created by Akekapon Suebprom on 2/1/2561 BE.
//  Copyright © 2561 kratostracking. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var btnLight: UIButton!
    var tapClick:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if tapClick == 0 {
            btnLight.setBackgroundImage(#imageLiteral(resourceName: "Light0"), for: .normal)
        }else{
            btnLight.setBackgroundImage(#imageLiteral(resourceName: "Light1"), for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLightControl(_ sender: UIButton) {
        
        if tapClick == 0 {
            tapClick = 1
            btnLight.setBackgroundImage(#imageLiteral(resourceName: "Light1"), for: .normal)
            
            Alamofire.request("http://0.0.0.0/ledoff").response { response in
                
                if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                    print("Data: On")
                }
            }
            
        }else if tapClick == 1 {
            tapClick = 0
            btnLight.setBackgroundImage(#imageLiteral(resourceName: "Light0"), for: .normal)
            Alamofire.request("http://0.0.0.0/ledon").response { response in
                
                if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                    print("Data: Off")
                }
            }
        }
        
        print("Tap is : ",tapClick)
    }
    
}

