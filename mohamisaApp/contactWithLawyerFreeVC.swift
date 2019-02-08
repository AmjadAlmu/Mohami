//
//  contactWithLawyerFreeVC.swift
//  ehtamiApp
//
//  Created by Amjad on 11/22/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import Alamofire

class contactWithLawyerFreeVC: UIViewController {

    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var issue: UITextView!
    
    @IBOutlet weak var sendbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Indicator.isHidden = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func sendIssue(_ sender: AnyObject) {
        self.Indicator.isHidden = false
        
        
        if  self.issue.text == "" {
            self.Indicator.isHidden = true
            Constants.alertcontroller(self, title: nil, message: "يرجى كتابة تفاصيل القضية")
            
        }
            
        else {
            
            
            Alamofire.request("http://lawyersa.co/lawyerApp/sendFreeIssues.php?user_id=\(User.userId)&type_id=\(Constants.currentTypeId)&explain_issue=\(self.issue.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&token=\(Constants.token)", encoding: JSONEncoding.default).validate().responseJSON { Response in
                switch Response.result {
                    
                case .success:
                    self.Indicator.isHidden = true
                    self.issue.text = ""
                    
                    let alert = UIAlertController(title: "تم إرسال استشارتك!", message: "سيتم الرد على استشارتك في اقرب وقت" , preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okButton = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in
                        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
                        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
                    })
                    
                    alert.addAction(okButton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                case .failure:
                    self.Indicator.isHidden = true
                    Constants.alertcontroller(self, title: "خطأ", message: "حاول مره اخرى")
                    
                }
                
            }
        }
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}
