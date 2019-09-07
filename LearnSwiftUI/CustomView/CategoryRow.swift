//
//  CategoryRow.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items:[Landmark]
    
    var body: some View {
        VStack(alignment:.leading){
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(self.items){ landmark in
                        
                       CategoryItem(landmark: landmark)
                    }
                }
            }.frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View{
        VStack(alignment: .leading){
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .shadow(radius: 3)
            
            Text(landmark.name)
                .font(.caption)
        }.padding(.leading, 15)
         //.padding(.top, 10)
    }
}

struct FeaturedLandmarkItem: View{
    var landmark: Landmark
    
    var body: some View{
        
        ZStack(alignment: .bottomLeading){
            landmark.image.resizable()
            VStack(alignment:.leading){
                Text(landmark.name)
                    .font(.title)
                Text(landmark.park)
                    .font(.subheadline)
            }.padding()
        }
        
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            ForEach(landmarks){ landmark in
                FeaturedLandmarkItem(landmark: landmark)
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
//        CategoryRow(categoryName: landmarkData[0].category.rawValue, items: Array(landmarkData.prefix(4)))
        
        FeaturedLandmarks(landmarks: Array(landmarkData.prefix(4)))
    }
}
