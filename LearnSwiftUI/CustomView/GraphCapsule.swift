//
//  GraphCapsule.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat{
        max(CGFloat(magnitude(of: range)/magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: CGFloat{
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var animation: Animation{
        Animation.spring(dampingFraction: 0.6)
            .speed(2)
            .delay(0.03 * Double(index))
    }
    
    var body: some View {
        Capsule()
            .fill(Color.gray)
            .frame(height: height * heightRatio, alignment: .bottom)
            .offset(x: 0, y: height * -offsetRatio)
            .animation(animation)
    }
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(index: 0, height: 100, range: 10..<50, overallRange: 0..<100)
    }
}
