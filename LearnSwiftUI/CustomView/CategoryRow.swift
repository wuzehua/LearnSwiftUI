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
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                            CategoryItem(landmark: landmark)
                        }
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
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .shadow(radius: 3)
            
            Text(landmark.name)
                .font(.caption)
                .foregroundColor(.primary)
            
        }.padding(.leading, 15)
         //.padding(.top, 10)
    }
}

struct FeaturedLandmarkItem: View{
    var landmark: Landmark
    
    var body: some View{
        
        ZStack(alignment: .bottomLeading){
            landmark.image
                .resizable()
                .renderingMode(.original)
            
            VStack(alignment:.leading){
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                Text(landmark.park)
                    .font(.subheadline)
                    .foregroundColor(.white)
                .shadow(radius: 2)

            }.padding()
            
        }
        
    }
}

struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(landmarks){ landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        FeaturedLandmarkItem(landmark: landmark)
                    }
                }
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
