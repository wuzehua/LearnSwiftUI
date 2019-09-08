//
//  FeaturedCard.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/8.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct FeaturedCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .renderingMode(.original)
            .aspectRatio(1.5, contentMode: .fit)
            .overlay(TextOverlay(landmark: landmark))
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient{
        LinearGradient(gradient:
            Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
                       startPoint: .bottom,
                       endPoint: .center)
    }
    
    var body: some View{
        ZStack(alignment: .bottomLeading){
            Rectangle().fill(gradient)
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
                    .font(.subheadline)
            }.foregroundColor(.white)
            .padding()
        }
    }
    
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(landmark: features[0])
    }
}
