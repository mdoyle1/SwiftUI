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
        var computers = ""
        for (key, value) in dict {
            var x=0
            let item = key + " " + value + "\n"
            if x < headers.count {
            computers+=item
            x+=1
            }
        }
        return Text(computers)
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

