//
//  paymentViewController.swift
//  ehtamiApp
//
//  Created by Amjad on 11/22/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import Alamofire

class paymentViewController: UIViewController {

    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    @IBOutlet weak var payment_number: UITextField!
    @IBOutlet weak var account_owner: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Indicator.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pay(_ sender: UIButton) {
        
        if  self.payment_number.text == "" || self.account_owner.text == ""{
            self.Indicator.isHidden = true
            Constants.alertcontroller(self, title: nil, message: "يرجى اكمال كافة الحقول")
            
        }
            
        else {

            Alamofire.request("http://lawyersa.co/lawyerApp/payment.php?user_id=\(User.userId)&issue_id=\(Constants.curentIssueId)&account_owner=\(self.account_owner.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&payment_number=\(self.payment_number.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&token=\(Constants.token)").validate().responseJSON { Response in
                switch Response.result {
                    
                case .success:
                    self.Indicator.isHidden = true
                    self.account_owner.text = ""
                    self.payment_number.text = ""
                    
                    let alert = UIAlertController(title: "تم حفظ بيانات الدفع", message: "يمكنك متابعة استشارتك من قائمة استشاراتي" , preferredStyle: UIAlertControllerStyle.alert)
                    
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
