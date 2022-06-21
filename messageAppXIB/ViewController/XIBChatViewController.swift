//
//  XIBChatViewController.swift
//  messageAppXIB
//
//  Created by 林祐辰 on 2022/6/21.
//

import UIKit

class XIBChatViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    
    
    @IBOutlet weak var statusHeaderView: UIStackView!
    @IBOutlet weak var statusFooterView: UIView!
    
    
    let chats = [
        Chat(userName: "Dalene Steward", status: .Idle, unreadCount: 5, message: MessageInfo(content: "Pls take a look at the images.", time: "18.31"), imageName: "avatar-0"),
        Chat(userName: "Fullsnack Designers", status: .None, unreadCount: 0, message: MessageInfo(content: "Hello guys, we have discussed about something else but I don't know.", time: "16.04"), imageName: "avatar-1"),
        Chat(userName: "Lee Williamson", status: .Online, unreadCount: 0, message: MessageInfo(content: "Yes, that’s gonna work, hopefully.", time: "06.12"), imageName: "avatar-2"),
        Chat(userName: "Ronald Mccoy", status: .Offline, unreadCount: 0, message: MessageInfo(content: "Thanks dude", time: "Yesterday"), imageName: "avatar-3"),
        Chat(userName: "Albert Bell", status: .Offline, unreadCount: 0, message: MessageInfo(content: "I‘m happy this anime has such great quality.", time: "Yesterday"), imageName: "avatar-4")
    ]

    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewConstraint()
        setupFooterView()
    }
    
    
    func setupTableViewConstraint(){
        let tableview = UITableView()
        self.view.insertSubview(tableview, at: 0)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "XIBmessageCell", bundle: nil), forCellReuseIdentifier: "XIBmessageCell")
        tableview.separatorStyle = .none
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        tableview.topAnchor.constraint(equalTo: statusHeaderView.bottomAnchor,constant: 25).isActive = true
        tableview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        tableview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func setupFooterView(){
        statusFooterView.layer.shadowOffset = CGSize(width: 0, height: -8)
        statusFooterView.layer.shadowRadius = 32
        statusFooterView.layer.shadowColor = UIColor(named: "DeepColor")?.cgColor
        statusFooterView.layer.shadowOpacity = 0.1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableviewCell = tableView.dequeueReusableCell(withIdentifier: "XIBmessageCell", for: indexPath) as? XIBmessageCell
        tableviewCell!.chatInfo = chats[indexPath.row]
        tableviewCell!.updateView()
        return tableviewCell!
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
}
