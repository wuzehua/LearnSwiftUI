//
//  Home.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var categories: [String: [Landmark]]{
        Dictionary(grouping: landmarkData, by: {$0.category.rawValue})
    }
        var featuredLandmarks: [Landmark]{
        landmarkData.filter{ $0.isFeatured }
    }
    
    @State var showProfile = false
    
    var profileButton: some View{
        Button(action: {
            self.showProfile.toggle()
        }){
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        
        NavigationView{
            List{
                FeaturedLandmarks(landmarks: featuredLandmarks)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                        .frame(height: 220)
                }
                .listRowInsets(EdgeInsets())
                
                
                NavigationLink(destination: LandmarkList())
                {
                    Text("See all")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showProfile){
                ProfileHost()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}



struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
