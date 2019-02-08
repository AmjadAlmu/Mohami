

import UIKit
import Alamofire
import SwiftyJSON

class LawyerViewController: UIViewController {
    
    var URL : String!
    
    @IBOutlet weak var lawImage: UIImageView!
    @IBOutlet weak var lawName: UILabel!

    @IBOutlet weak var lawCity: UILabel!

    @IBOutlet weak var lawInfo: UILabel!
    @IBOutlet weak var indicatr: UIActivityIndicatorView!

    @IBOutlet weak var sendbtn: UIButton!
    
    var lawImg:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        


        self.indicatr.isHidden = false

        Alamofire.request("http://lawyersa.co/lawyerApp/lawyer.php?id=\(Constants.currentLawyerId)&token=\(Constants.token)").validate().responseJSON { Response in
            switch Response.result {
            case .success:
                self.indicatr.isHidden = true 
                if let value = Response.result.value {
                    let targetlawyer = JSON(value)

                    self.lawName.text = " \(targetlawyer["first_name"].stringValue)"
                    self.lawCity.text = targetlawyer["city"].stringValue
                    self.lawInfo.text = targetlawyer["genral_info_more"].stringValue
                    
                    if Constants.curentLawyergender == 1 {
                        self.lawImg = "famale"
                    }else {
                        self.lawImg = "male"
                    }
                    
                    let bundlePath = Bundle.main.path(forResource: self.lawImg, ofType: "jpg")
                    self.lawImage.image = UIImage(contentsOfFile: bundlePath!)!
                    
                }

        
            case .failure:
            self.indicatr.isHidden = true
            Constants.alertcontroller(self, title: "خطأ", message: "حدث خطأ اثناء التحميل")
                
            }//end switch
        
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
