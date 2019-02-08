//
//  issuesarchiveCell.swift
//  ehtamiApp
//
//  Created by Amjad on 11/20/1437 AH.
//  Copyright © 1437 Amjad. All rights reserved.
//

import UIKit

class issuesarchiveCell: UITableViewCell {
    @IBOutlet weak var explain_issue: UILabel!

    @IBOutlet weak var lawyer_reply: UILabel!
    
    @IBOutlet weak var paymentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func creatCell (_ explain_issue:String , lawyer_reply:String ){
        self.explain_issue.text = explain_issue
        self.lawyer_reply.text = lawyer_reply
    }

}
