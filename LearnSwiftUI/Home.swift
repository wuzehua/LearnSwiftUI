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
    
    
    var body: some View {
        
        NavigationView{
            List{
                
                
                
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                        .frame(height: 210)
                }
            }
            .navigationBarTitle(Text("Featured"))
        }
    }
}



struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
