//
//  ChatTableViewCell.swift
//  e-commerce
//
//  Created by Mohamed on 14/09/2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageBackgroundView: UIView!
    
    
    //MARK: - Vars
    var trailingConstraint: NSLayoutConstraint!
    var leadingConstraint: NSLayoutConstraint!
    
    
    override func prepareForReuse() {
        messageLabel.text = nil
        trailingConstraint.isActive = false
        leadingConstraint.isActive = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        messageBackgroundView.layer.cornerRadius = 16
        messageBackgroundView.clipsToBounds = true
    }
    
    func updateMessageCell(by message: MessageData) {
        trailingConstraint = messageBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        leadingConstraint = messageBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        
        messageLabel.text = message.text
        
        if message.isFirstUser {
            messageBackgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            trailingConstraint.isActive = true
            messageLabel.textAlignment = .right
        } else {
            messageBackgroundView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            leadingConstraint.isActive = true
            messageLabel.textAlignment = .left
        }
        
    }
}
