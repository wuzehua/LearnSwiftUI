//
//  HikeView.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

extension AnyTransition{
    static var moveInAndOut: AnyTransition{
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    var hike: Hike
    @State var showDetails = true
    
    var body: some View {
        VStack{
            HStack{
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading){
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()
                
                Button(action:{
                    withAnimation{
                        self.showDetails.toggle()
                    }
                }){
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetails ? 90 : 0))
                        .scaleEffect(showDetails ? 1.5 : 1.0)
                        .padding()
                        //.animation(.spring())
                }
            }
            //.padding()
            
            
            
            
            
            if showDetails{
                HikeDetail(hike: hike)
                    .transition(.moveInAndOut)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack{
            HikeView(hike: hikeData[0])
                .padding()
            
            Spacer()
        }
    }
}
