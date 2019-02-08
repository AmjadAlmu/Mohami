//
//  signUpVC.swift
//  ehtamiApp
//
//  Created by Amjad on 11/4/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signUpVC: UIViewController {

    @IBOutlet weak var indicatr: UIActivityIndicatorView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    var userLogged = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicatr.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if self.name.text == "" || self.password.text == "" || self.email.text == "" || self.phoneNumber.text == ""{
            self.indicatr.isHidden = true
            Constants.alertcontroller(self, title: nil, message: "يرجى اكمال كافة الحقول")
            
        } else {
            Alamofire.request("http://lawyersa.co/lawyerApp/signUp.php?name=\(self.name.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&email=\(self.email.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&user_phone_number=\(self.phoneNumber.text!)&password=\(self.password.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&token=\(Constants.token)").validate().responseJSON { Response in
                switch Response.result {
                case .success:
                    self.indicatr.isHidden = true
                    if let value = Response.result.value {
                        let targetUser = JSON(value)
                        self.userLogged = targetUser["Res"].stringValue
                        if(self.userLogged.caseInsensitiveCompare("true") == ComparisonResult.orderedSame){
                            User.userId = targetUser["id"].intValue
                            User.userName = targetUser["name"].stringValue
                            User.userEmail = targetUser["email"].stringValue
                            User.user_phone_number = targetUser["user_phone_number"].stringValue
                            User.userPassword = targetUser["password"].stringValue
                            
//                            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
//                                                            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true);

//                                                        let alert = UIAlertController(title: "شكرا لتسجيلك", message: "للمتابعة يرجى تسجيل الدخول بالبيانات التي ادخلتها" , preferredStyle: UIAlertControllerStyle.Alert)
//                            
//                            let okButton = UIAlertAction(title: "موافق", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
//                                let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
//                                self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
//                            })
//                            
//                            alert.addAction(okButton)
//                            
//                            self.presentViewController(alert, animated: true, completion: nil)
                            
                            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
                            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true);
                            
                        }else {
                            Constants.alertcontroller(self, title: "خطأ", message: "البريد الالكتروني المدخل مستخدم من قبل")
                            self.email.text = ""
                        }
                        
                    }
                case .failure:
                    self.indicatr.isHidden = true
                    Constants.alertcontroller(self, title: "خطأ", message: "حدث خطأ اثناء التحميل")
                }//end  switch pass
            }
            
        }
   


    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    @IBAction func goBackTologInView(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }

}
