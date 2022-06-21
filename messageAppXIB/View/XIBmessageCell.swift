//
//  XIBmessageCell.swift
//  messageAppXIB
//
//  Created by 林祐辰 on 2022/6/21.
//

import UIKit

class XIBmessageCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var timeString: UILabel!
    @IBOutlet weak var notiView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    let selectBackground = UIView()
    var chatInfo:Chat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupSelectBackground(){
        selectBackground.backgroundColor = UIColor(named: "PrimaryColor-0.1")
        selectBackground.layer.cornerRadius = 10
        self.selectedBackgroundView = selectBackground
    }
    
    func updateView(){
        setupSelectBackground()
        
        guard let chatInfo = chatInfo else {
            return
        }

        avatarImage.image = UIImage(named: chatInfo.imageName)
        personName.text = chatInfo.userName
        messageText.text = chatInfo.message.content
        timeString.text = chatInfo.message.time
        
        if chatInfo.unreadCount > 0 {
            notiView.isHidden = false
            (notiView.subviews.first as! UILabel).text = "\(chatInfo.unreadCount)"
        } else {
            notiView.isHidden = true
        }
    
        
        if chatInfo.status != .None {
            statusView.isHidden = false
            let status = statusView.subviews.first
            switch chatInfo.status {
            case .Idle:
                status?.backgroundColor = UIColor(named: "YellowColor")
            case .Online:
                status?.backgroundColor = UIColor(named: "GreenColor")
            case .Offline:
                status?.backgroundColor = .gray
            default:
                break
            }
        } else {
            statusView.isHidden = true
        }
    }
        
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
