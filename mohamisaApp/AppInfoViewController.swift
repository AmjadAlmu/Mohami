//
//  AppInfoViewController.swift
//  ehtamiApp
//
//  Created by Amjad on 11/18/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.navigationController?.setupNavigationBar()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if User.userId == 0 {
            let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.navigationController?.pushViewController(logIn, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func socialMediaAccounts(_ sender: UIButton) {
        
        if sender.tag == Constants.instagramAccount {
            if let requestUrl = URL(string: "https://www.instagram.com/mohami_lawyer/") {
                UIApplication.shared.openURL(requestUrl)
            }
            
        }
        
        if sender.tag == Constants.twitterAccount {
            if let requestUrl = URL(string: "https://twitter.com/mohami_lawyer") {
                UIApplication.shared.openURL(requestUrl)
            }
            
        }
        
        if sender.tag == Constants.facebookAccount {
            if let requestUrl = URL(string: "https://lawyersa.co") {
                UIApplication.shared.openURL(requestUrl)
            }
            
        }
    }

}
