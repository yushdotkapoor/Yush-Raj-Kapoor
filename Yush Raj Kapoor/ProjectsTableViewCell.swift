//
//  ProjectsTableViewCell.swift
//  Yush Raj Kapoor
//
//  Created by Yush Raj Kapoor on 9/25/21.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var titl: UILabel!
    @IBOutlet weak var imgView: UIView!
    
    var img:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 20
        selectedBackgroundView?.layer.cornerRadius = 20
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadows(uiview: imgView)
    }
    
    func addShadows(uiview:UIView) {
        uiview.layer.cornerRadius = uiview.frame.height/4
        addShadow(uiview: uiview)
        uiview.layer.shadowOffset = CGSize(width: 1, height: 1)
        uiview.layer.shadowRadius = 3
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: uiview.frame.width, height: uiview.frame.height))
        imgView.image = img
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.frame.height/4
        uiview.addSubview(imgView)
        
        addShadow(uiview: self)
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 6
    }
    
    func addShadow(uiview:UIView) {
        uiview.layer.masksToBounds = false
        uiview.layer.shadowColor = UIColor.secondaryLabel.cgColor
        uiview.layer.shadowOpacity = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
