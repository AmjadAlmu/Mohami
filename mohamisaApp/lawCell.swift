
import UIKit

class lawCell: UITableViewCell {

    @IBOutlet weak var lawImg: UIImageView!
    @IBOutlet weak var lawName: UILabel!
    @IBOutlet weak var lawCity: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func creatCell (_ name:String , Img:UIImage , City:String ){
        self.lawImg.image = Img
        self.lawName.text = name
        self.lawCity.text = City
    }
}
