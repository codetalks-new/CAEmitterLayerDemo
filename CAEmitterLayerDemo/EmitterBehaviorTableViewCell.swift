//
//  EmitterBehaviorTableViewCell.swift
//  CAEmitterLayerDemo
//
//  Created by Haizhen Lee on 25/05/2017.
//  Copyright © 2017 BetaGo. All rights reserved.
//

import UIKit

class EmitterBehaviorTableViewCell: UITableViewCell {
  var titleView:UILabel?
  var subTitleView:UILabel?
  var switchView:UISwitch?
  var editButton:UIButton?
  

    override func awakeFromNib() {
        super.awakeFromNib()
      titleView = contentView.viewWithTag(1) as? UILabel
      subTitleView = contentView.viewWithTag(2) as? UILabel
      switchView = contentView.viewWithTag(3) as? UISwitch
      editButton = contentView.viewWithTag(4) as? UIButton
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
