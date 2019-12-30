//
//  ListView.swift
//  csvSearch
//
//  Created by developer on 12/12/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI



struct SectionView : View {
    @State var dict = [String: String]()
    var body: some View {
        let keys = dict.map{$0.key}
        let values = dict.map {$0.value}

        return  ForEach(keys.indices) {index in
            HStack {
                Text(keys[index] + " " + values[index])
            }
        }
    }
}

struct ListView: View {

    var body: some View {
  
        List {
            ForEach(csvArray, id:\.self) { dict in
                           Section {
                            SectionView(dict: dict)
                           }
            }
        }
    }
    
}
