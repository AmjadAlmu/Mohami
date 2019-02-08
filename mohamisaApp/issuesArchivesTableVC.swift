//
//  issuesArchivesTableVC.swift
//  ehtamiApp
//
//  Created by Amjad on 11/20/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class issuesArchivesTableVC: UITableViewController, UITabBarDelegate  {
  
    
    var Issues:[freeIssue] = []
//    var issuesReply:String = ""
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.center = view.center
        indicator.startAnimating()
        view.addSubview(indicator)
        
        self.navigationController?.setupNavigationBar()
        
//        loadInfo ()
//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if User.userId == 0 {
            let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.navigationController?.pushViewController(logIn, animated: true)
        }
        
        self.Issues.removeAll()
                loadInfo ()
                self.tableView.reloadData()
//        print(323)
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
//        loadInfo ()
//        self.tableView.reloadData()
        if !self.Issues.isEmpty{
            indicator.isHidden = true
        }
    }
    
//    override func awakeFromNib() {
//        loadInfo ()
//        self.tableView.reloadData()
//    }
    
//    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        loadInfo ()
//        self.tableView.reloadData()
//        print(323)
//    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Issues.count
    }
    
    func loadInfo (){
        Alamofire.request("http://lawyersa.co/lawyerApp/userIssues2.php?user_id=\(User.userId)&token=\(Constants.token)").validate().responseJSON { response in
            switch response.result {
            case .success:
                self.indicator.isHidden = true
                if let value = response.result.value {
                    let json = JSON(value)
                    for (_,subDataJSON):(String, JSON) in json  {
                        let issue = freeIssue()
                        issue.explain_issue = subDataJSON["explain_issue"].stringValue
                        issue.lawyer_reply = subDataJSON["lawyer_reply"].stringValue
                        issue.isFree = subDataJSON["isFree"].intValue
                        issue.issue_id = subDataJSON["issue_id"].intValue
                        issue.payment = subDataJSON["payment"].intValue
                        issue.userPay = subDataJSON["userPay"].intValue
                        
                        self.Issues.append(issue)
                        
                    }
                    
                    self.tableView.reloadData()
//                    print(4444444)
                    
                }
            case .failure:
                self.indicator.isHidden = true
                Constants.alertcontroller(self, title: "خطأ", message: "لا يوجد اتصال بالانترنت")
                
            }//end switch
            
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let issue = Issues[(indexPath as NSIndexPath).row]
        let issuePayment = issue.payment
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "issuesarchiveCell", for: indexPath) as! issuesarchiveCell
        
        
        if issue.isFree == 1{//مجانيه

            if issue.lawyer_reply == "none"{//مارد المحامي
                issue.lawyer_reply = "هذه الاستشاره مجانيه سيتم اعلامك عند رد المحامي على الاستشاره"
            }
            
            cell.paymentButton.isHidden = true
        }
        else {// مدفوعه
            if issue.userPay == 1 {//دفع
                if issuePayment == 0 {//لم يتم التاكيد من الاداره
                   issue.lawyer_reply = "بإنتظار تاكيد الدفع من قبل الاداره وسيتم اعلامك عند رد المحامي"
                    
                }
                else {//تم التاكيد من الاداره
                    
                    if issue.lawyer_reply == "none"{//مارد المحامي
                       issue.lawyer_reply = "تم تأكيد الدفع، سيتم اعلامك عند رد المحامي على الاستشاره"
                    }
                    
                }
            
               cell.paymentButton.isHidden = true
            }
            else {//مادفع
                issue.lawyer_reply = "يرجى الذهاب لصفحة الدفع، ليتمكن المحامي من الرد عليك"
                cell.paymentButton.isHidden = false
            }
        }
        
        cell.creatCell(issue.explain_issue, lawyer_reply: issue.lawyer_reply)
        cell.paymentButton.tag = (indexPath as NSIndexPath).row

        cell.paymentButton.addTarget(self, action: #selector(self.transitonMethod), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    
    func transitonMethod(_ sender: AnyObject){

          let indexPath = sender.tag
        Constants.curentIssueId = Issues[indexPath!].issue_id
        
        let paymentView = self.storyboard?.instantiateViewController(withIdentifier: "paymentViewController") as! paymentViewController
        self.navigationController?.pushViewController(paymentView, animated: true)

        
    }
    

}
