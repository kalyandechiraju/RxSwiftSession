//
//  SRTableViewCell.swift
//  Reactor
//
//  Created by Kalyan Dechiraju on 04/09/17.
//  Copyright © 2017 Codelight Studios. All rights reserved.
//

import UIKit

class SRTableViewCell: UITableViewCell {
    
    static let Identifier = "SRCell"

    @IBOutlet weak var nickNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(result: SurveyResult) {
        nickNameLabel.text = result.nickname
    }

}
