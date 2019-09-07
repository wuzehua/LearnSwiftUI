//
//  Badge.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct Badge: View {
    
    static let rotateCount = 8
    
    var badgeSymbols: some View{
        ForEach(0..<Badge.rotateCount) { i in
            RotateBadgeSymbol(angle: .init(degrees: Double(i) * (360.0 / Double(Badge.rotateCount))))
                .opacity(0.5)
        }
    }
    
    var body: some View {
        
        ZStack {
            BadgeBackground()
            
            GeometryReader{ geometry in
                self.badgeSymbols
                    .scaleEffect(0.25, anchor: .top)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.75)
                
            }.scaledToFit()
        }
    }
    
    
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
