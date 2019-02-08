//
//  mainViewController.swift
//  ehtamiApp
//
//  Created by Amjad on 11/4/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
//import SideMenu
import SwiftyJSON



class mainViewController: UIViewController {
    
    @IBAction func exitbtn(_ sender: UIBarButtonItem) {
//        UIBarButtonI
        
        User.userId == 0
        let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
        self.navigationController?.pushViewController(logIn, animated: true)
        
    }
    var types:[type] = []
    var typesTitles:[String] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.tabBarController?.tabBar.hidden = true
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        if User.userId == 0 {
            let logIn = self.storyboard?.instantiateViewController(withIdentifier: "logInViewController") as! logInViewController
            self.navigationController?.pushViewController(logIn, animated: true)
        }
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBOutlet weak var chooseType: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var typesMenu = DropDown()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseType.layer.cornerRadius = 7
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.setupNavigationBar()

        loadTypesFromServer ()
        
//                if User.userId == 0 {
//                    let logIn = self.storyboard?.instantiateViewControllerWithIdentifier("logInViewController") as! logInViewController
//                    self.navigationController?.pushViewController(logIn, animated: true)
//                }

        
//        var leftBarButtonItem : UIBarButtonItem!
//        self.navigationController?.
//        setupSideMenu()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadTypesFromServer (){
        Alamofire.request("http://lawyersa.co/lawyerApp/types2.php?token=\(Constants.token)").validate().responseJSON { response in
            switch response.result {
            case .success:
                self.indicator.isHidden = true
                if let value = response.result.value {
                    let json = JSON(value)

                    for (_,subDataJSON):(String, JSON) in json  {
                        let t = type()
                        t.id = subDataJSON["id"].intValue
                        t.type = subDataJSON["type"].stringValue
                        t.isFree = subDataJSON["isFree"].intValue
                        self.types.append(t)

                    }
                    
                    for typeTitle in self.types {
                        let price = typeTitle.isFree
                        var priceTitle:String
                        
                        if price == 1 {
                            priceTitle = "مجانية"
                        }else {
                            priceTitle = "مدفوعة"
                        }

                        self.typesTitles.append("\(typeTitle.type) - \(priceTitle)")
                    }
                    
                    
                    self.setupMenu()

                }
            case .failure:
                self.indicator.isHidden = true
                Constants.alertcontroller(self, title: "خطأ", message: "لا يوجد اتصال بالانترنت")
                
            }//end switch
            
        }
        
    }
    @IBAction func chooseTypeButton(_ sender: UIButton) {
        
        typesMenu.show()
        
    }
    
    
    func setupMenu () {
        
            typesMenu.anchorView = chooseType
            typesMenu.bottomOffset = CGPoint(x: 0, y: chooseType.bounds.height)
            typesMenu.dataSource = typesTitles
            
            typesMenu.selectionAction = { [unowned self] (index, item) in
                self.chooseType.setTitle(item, for: .normal)
                
                Constants.currentTypeId = self.types[index].id
                
                let lawyersList = self.storyboard?.instantiateViewController(withIdentifier: "lawyersTableVC") as! lawyersTableVC
                
                let contactWithLawyer = self.storyboard?.instantiateViewController(withIdentifier: "contactWithLawyerFree") as! contactWithLawyerFreeVC
                
                if self.types[index].isFree == 1 {
                  self.navigationController?.pushViewController(contactWithLawyer, animated: true)
                }
                else {
                    self.navigationController?.pushViewController(lawyersList, animated: true)
                    
                }
                
                
            }
        }
        
    
//    func setupSideMenu () {
//        SideMenuManager.menuRightNavigationController = storyboard!.instantiateViewControllerWithIdentifier("RightMenuNavigationController") as? UISideMenuNavigationController
//        
//        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
//        
//        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
//        
//        SideMenuManager.menuPresentMode = .ViewSlideInOut
//        
//        SideMenuManager.menuAnimationBackgroundColor = UIColor(red:0.51, green:0.39, blue:0.37, alpha:1.0)
//        
//        SideMenuManager.menuBlurEffectStyle = nil
//        
//        SideMenuManager.menuFadeStatusBar = false
//    }
    
    
    func popMethod (){
        self.navigationController!.popToRootViewController(animated: false)
    }
    
}
