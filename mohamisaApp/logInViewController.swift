
import UIKit
import Alamofire
import SwiftyJSON

class logInViewController: UIViewController {
    var userLogged = ""

    @IBOutlet weak var Password: UITextField!

    @IBOutlet weak var indicatr: UIActivityIndicatorView!
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.indicatr.isHidden = true
       
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
    
    

    @IBAction func logIn(_ sender: AnyObject) {
        self.indicatr.isHidden = false
        if self.Email.text == "" || self.Password.text == ""{
            self.indicatr.isHidden = true
            Constants.alertcontroller(self, title: nil, message: "يرجى اكمال كافة الحقول")
            
        }
        else {
        
            Alamofire.request("http://lawyersa.co/lawyerApp/logIn.php?email=\(self.Email.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&password=\(self.Password.text!.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!)&token=\(Constants.token)").validate().responseJSON { Response in
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
//                           print(targetUser)
                            self.navigationController?.popViewController(animated: true)
                        }
                        else {
                            Constants.alertcontroller(self, title: "خطأ", message: "يرجى التأكد من الايميل والباسورد")
                            self.Email.text = ""
                            self.Password.text = ""
                        }
                    }
                    
                case .failure:
                    self.indicatr.isHidden = true
                    Constants.alertcontroller(self, title: "خطأ", message: "حدث خطأ اثناء التحميل")
                    
                }//end switch
                
            }
        }
        
    }
 
    @IBAction func socialMediaAccounts(_ sender: AnyObject) {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func signUp(_ sender: UIButton) {
        
        let signUp = self.storyboard?.instantiateViewController(withIdentifier: "signUpVC") as! signUpVC
        self.navigationController?.pushViewController(signUp, animated: true)
    }

}

