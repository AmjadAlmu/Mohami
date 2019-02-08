//
//  accountSettingsViewController.swift
//  ehtamiApp
//
//  Created by Amjad on 11/18/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class accountSettingsViewController: UIViewController {
    @IBOutlet weak var indicatr: UIActivityIndicatorView!

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPhoneNumber: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var saveChangebtn: UIButton!
    var infoUpdated = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveChangebtn.isEnabled = false
        self.saveChangebtn.alpha = 0.7
        
        userName.text = User.userName
        userEmail.text = User.userEmail
        userPhoneNumber.text = User.user_phone_number
        userPassword.text = User.userPassword
        
        self.indicatr.isHidden = true
        self.navigationController?.setupNavigationBar()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if User.userId == 0 {
            let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.navigationController?.pushViewController(logIn, animated: true)
            
            
        }
        
        userName.text = User.userName
        userEmail.text = User.userEmail
        userPhoneNumber.text = User.user_phone_number
        userPassword.text = User.userPassword
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        
         User.userId == 0
            let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.navigationController?.pushViewController(logIn, animated: true)
        
    }

    @IBAction func infoChange(_ sender: UITextField) {
        self.saveChangebtn.isEnabled = true
        self.saveChangebtn.alpha = 1.0
    }
    
    @IBAction func saveChange(_ sender: UIButton) {
        self.indicatr.isHidden = false
        
            Alamofire.request("http://lawyersa.co/lawyerApp/updateInfo.php?id=\(User.userId)&user_phone_number=\(self.userPhoneNumber.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&password=\(self.userPassword.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&token=\(Constants.token)").validate().responseJSON { Response in
                switch Response.result {
                case .success:
                    self.indicatr.isHidden = true
                    if Response.result.value != nil {
                       
                        Alamofire.request("http://lawyersa.co/lawyerApp/user.php?id=\(User.userId)&token=\(Constants.token)").validate().responseJSON { Response in
                            switch Response.result {
                            case .success:
                                if let value = Response.result.value {
                                    let targetUser = JSON(value)
                                    User.user_phone_number = targetUser["user_phone_number"].stringValue
                                    User.userPassword = targetUser["password"].stringValue
                                    self.userPhoneNumber.text = User.user_phone_number
                                    self.userPassword.text = User.userPassword
                                    let alert = UIAlertController(title: "تم التحديث", message: "تم تحديث بيانتك بنجاح" , preferredStyle: UIAlertControllerStyle.alert)
                                    
                                    let okButton = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in
                                        self.navigationController?.popViewController(animated: true)
                                    })
                                    
                                    alert.addAction(okButton)
                                    
                                    self.present(alert, animated: true, completion: nil)
                                    
                                }
                                
                            case .failure:
                                self.indicatr.isHidden = true
                                Constants.alertcontroller(self, title: "خطأ", message: "حدث خطأ اثناء التحميل")
                                
                            }//end switch
                            
                        }
  
                    }
                    
                case .failure:
                    self.indicatr.isHidden = true
                    Constants.alertcontroller(self, title: "خطأ", message: "حدث خطأ اثناء التحميل")
                    
                }//end switch
                
            }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}
