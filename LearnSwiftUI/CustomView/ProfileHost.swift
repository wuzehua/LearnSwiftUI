//
//  ProfileHost.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var mode
    @State var profile = Profile.default
    @State var draftProfile = Profile.default

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            
            
            if self.mode?.wrappedValue == .inactive{
                HStack{
                    Spacer()
                    EditButton()
                }
                
                ProfileSummary(profile: profile)
            }
            else{
                
                HStack{
                    Button(action: {
                        self.profile = self.draftProfile
                        self.mode?.animation().wrappedValue = .inactive
                    }){
                        Text("Done").bold()
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        self.mode?.animation().wrappedValue = .inactive
                    }){
                        Text("Cancel")
                    }
                }
                
                ProfileEditor(profile: $draftProfile)
                .onDisappear(perform: {
                    self.draftProfile = self.profile
                })
            }
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
