//
//  ProfileEditor.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/8.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Name").bold()
                Divider()
                TextField("Username", text: $profile.userName)
            }
            
            Toggle(isOn: $profile.preferNotifications){
                Text("Enable Notification")
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonPhoto){
                    ForEach(Profile.Season.allCases, id: \.self){ season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Goal Date").bold()
                
                DatePicker("Goal Date",
                           selection: $profile.goalDate,
                           in: dateRange,
                           displayedComponents: .date)
            }.padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
