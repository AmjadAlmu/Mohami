

import Foundation
import UIKit

class Constants {
    
    //accounts ID
    static let twitterAccount = 1
    static let instagramAccount = 2
    static let facebookAccount = 3
    
    static var currentLawyerId = 0
    static var currentTypeId = 0
    static var curentLawyergender = 0
    static var curentIssueId = 0
    
//    static var userPay:Bool = true
    
    static let token = "skfagnfjkgkfdgnksdgnKJJKJkJKHJKHHjhjhjkereewrbjkjk"
    
    
    //alert function
    static func alertcontroller (_ VC: UIViewController ,title: String?, message:String? ){
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertControllerStyle.alert)
        
        let okButton = UIAlertAction(title: "موافق", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okButton)
        
        VC.present(alert, animated: true, completion: nil)
        
    }
    

}

extension UINavigationController {
    
    func setupNavigationBar() {
        
        self.isNavigationBarHidden = false
        
        self.navigationBar.barTintColor = UIColor(red:0.51, green:0.39, blue:0.37, alpha:1.0)
//        self.navigationBar.translucent = false
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
    }

}


