//
//  HexagonParameters.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct HexagonParameters {
    
    struct Segment {
        let useWidth: (CGFloat, CGFloat, CGFloat)
        let useHeight: (CGFloat, CGFloat, CGFloat)
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let points = [
        Segment(
            useWidth: (1.0, 1.0, 1.0),
            useHeight: (1.0, 1.0, 0.0),
            xFactors: (0.6, 0.4, 0.5),
            yFactors: (0.05, 0.05, 0.0)
        ),
        
        Segment(
            useWidth: (1.0, 1.0, 0.0),
            useHeight: (1.0, 1.0, 1.0),
            xFactors: (0.05, 0.0, 0.0),
            yFactors: (0.2 + adjustment, 0.3 + adjustment, 0.25 + adjustment)
        ),
        
        Segment(
            useWidth: (1.0, 1.0, 0.0),
            useHeight: (1.0, 1.0, 1.0),
            xFactors: (0.0, 0.05, 0.0),
            yFactors: (0.7 - adjustment, 0.8 - adjustment, 0.75 - adjustment)
        ),
        
        Segment(
            useWidth: (1.0, 1.0, 1.0),
            useHeight: (1.0, 1.0, 1.0),
            xFactors: (0.4, 0.6, 0.5),
            yFactors: (0.95, 0.95, 1.0)
        ),
        
        Segment(
            useWidth: (1.0, 1.0, 1.0),
            useHeight: (1.0, 1.0, 1.0),
            xFactors: (0.95, 1.0, 1.0),
            yFactors: (0.8 - adjustment, 0.7 - adjustment, 0.75 - adjustment)
        ),
        
        Segment(
            useWidth: (1.0, 1.0, 1.0),
            useHeight: (1.0, 1.0, 1.0),
            xFactors: (1.0, 0.95, 1.0),
            yFactors: (0.3 + adjustment, 0.2 + adjustment, 0.25 + adjustment)
        )
    ]
}
