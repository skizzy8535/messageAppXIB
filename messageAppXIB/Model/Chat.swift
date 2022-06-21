//
//  Chat.swift
//  messageAppXIB
//
//  Created by 林祐辰 on 2022/6/21.
//

import Foundation


enum OnlineStatus {
    case Online, Offline, Idle, None
}

struct MessageInfo: Hashable {
    var content: String
    var time: String
}


struct Chat {
    var userName: String
    var status: OnlineStatus
    var unreadCount: Int
    var message: MessageInfo
    var imageName:String
    
    init(userName:String,status: OnlineStatus,unreadCount: Int,message: MessageInfo,imageName:String){
        self.userName = userName
        self.status = status
        self.unreadCount = unreadCount
        self.message = message
        self.imageName = imageName
    }
}



