//
//  ProfileSummary.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/8.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    @State var profile = Profile.default
    
    static let formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter
    }()
    
    var body: some View {
        List{
            Text(profile.userName)
                .font(.title)
                .bold()
            
            Text("Notification: \(profile.preferNotifications ? "On" : "Off")")
            
            Text("Season: \(profile.seasonPhoto.rawValue)")
            
            Text("Goal Date: \(profile.goalDate, formatter: ProfileSummary.formatter)")
            
            VStack(alignment: .leading){
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }.frame(height: 140)
            }
            
            VStack(alignment: .leading){
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
    }
}
