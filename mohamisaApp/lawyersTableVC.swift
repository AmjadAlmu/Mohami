

import UIKit
import Alamofire 
import SwiftyJSON

class lawyersTableVC: UITableViewController {
    
    
    var Lawyers:[Lawyer] = []
    var lawImg:String = ""
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        indicator.center = view.center
        indicator.startAnimating()
        view.addSubview(indicator)
        
        
        loadInfo ()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !self.Lawyers.isEmpty{
            indicator.isHidden = true
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lawyers.count
    }
   
    
    
    func loadInfo () {

        Alamofire.request("http://lawyersa.co/lawyerApp/lawyersListByType2.php?type_id=\(Constants.currentTypeId)&token=\(Constants.token)").validate().responseJSON { response in
            switch response.result {
            case .success:
                self.indicator.isHidden = true
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subDataJSON):(String, JSON) in json  {
                        let lawyer = Lawyer()
                        lawyer.first_name = subDataJSON["first_name"].stringValue
                        lawyer.city = subDataJSON["city"].stringValue
                        lawyer.gender = subDataJSON["gender"].intValue
                        lawyer.id =  subDataJSON["id"].intValue

                        self.Lawyers.append(lawyer)

                    }
                    
                    self.tableView.reloadData()
                    
                }
            case .failure:
                self.indicator.isHidden = true
                Constants.alertcontroller(self, title: "خطأ", message: "لا يوجد اتصال بالانترنت")
                
            }//end switch
            
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let lawyer = Lawyers[(indexPath as NSIndexPath).row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "lawCell", for: indexPath) as! lawCell
        if lawyer.gender == 1 {
            lawImg = "famale"
        }else {
            lawImg = "male"
        }
          let bundlePath = Bundle.main.path(forResource: lawImg, ofType: "jpg")

        cell.creatCell(lawyer.first_name, Img: UIImage(contentsOfFile: bundlePath!)!, City: lawyer.city)

            return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Constants.currentLawyerId = Lawyers[(indexPath as NSIndexPath).row].id
        Constants.curentLawyergender = Lawyers[(indexPath as NSIndexPath).row].gender
        
        let LawyerInfo = self.storyboard?.instantiateViewController(withIdentifier: "LawyerViewController") as! LawyerViewController
        self.navigationController?.pushViewController(LawyerInfo, animated: true)
        
    }

}
