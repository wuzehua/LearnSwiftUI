//
//  Profile.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import Foundation

struct Profile {
    var userName: String
    var preferNotifications: Bool
    var seasonPhoto:Season
    var goalDate:Date
    
    static let `default` = Self(userName: "Default")
    
    init(userName: String, preferNotifications: Bool = true, seasonPhoto: Season = .winter) {
        self.userName = userName
        self.preferNotifications = preferNotifications
        self.seasonPhoto = seasonPhoto
        self.goalDate = Date()
    }
    
    
    enum Season:String, CaseIterable {
        case spring = "🌺"
        case summer = "🌞"
        case fall = "🍁"
        case winter = "❄️"
    }
}
