//
//  HikeDetail.swift
//  LearnSwiftUI
//
//  Created by RainZhong on 2019/9/7.
//  Copyright © 2019 RainZhong. All rights reserved.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack{
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200, alignment: .center)
            
            
            HStack(spacing: 30){
                ForEach(buttons, id: \.0){ value in
                    Button(action: {
                        self.dataToShow = value.1
                    })
                    {
                        Text(verbatim: value.0)
                            .font(.system(size: 15))
                            .foregroundColor( value.1 == self.dataToShow ?
                                Color.gray : Color.accentColor
                        )
                        .animation(nil)
                    }
                }
            }
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: hikeData[0])
    }
}
