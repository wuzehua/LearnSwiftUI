//
//  LandmarkList.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/4.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        
            List{
                
                Toggle(isOn: $userData.showFavoriteOnly){
                    Text("Favorite Only")
                }
                
                ForEach(userData.landmarks){ landmark in
                
                    if landmark.isFavorite || !self.userData.showFavoriteOnly {
                        NavigationLink(destination:
                            LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ){
                            LandmarkRow(landmark: landmark)
                            
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkList()
        }.environmentObject(UserData())
    }
}
