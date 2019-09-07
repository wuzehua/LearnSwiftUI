//
//  LandmarkRow.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/4.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .cornerRadius(5)
                .frame(width: 50, height: 50)
                .shadow(radius: 5)

            Text(landmark.name)
                    
            Spacer()
            
            if landmark.isFavorite
            {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
            
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        LandmarkRow(landmark: landmarkData[0])
        LandmarkRow(landmark: landmarkData[1])
            
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
