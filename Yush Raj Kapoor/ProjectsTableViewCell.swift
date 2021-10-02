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
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = img.frame.height/4
        backgroundColor = .secondarySystemBackground
        //backgroundView?.backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 20
        
    }
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
