//
//  ListView.swift
//  csvSearch
//
//  Created by developer on 12/12/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI

var formatedList:[String] = []
var keys:[String] = []
var values:[String] = []
func listBuilder(){
    for item in csvArray {
        var computers = ""
        
        for (key, value) in item {
            var x=0
            let item = key + ":  " + value + "\n"
            if x < headers.count {
            computers+=item
            x+=1
            }
        }
        formatedList.append(computers)
    }
}

//struct SectionView : View {
//    @State var dict = [String: String]()
//    var body: some View {
//        var computers = ""
//        for (key, value) in dict {
//            var x=0
//            let item = key + " " + value + "\n"
//            if x < headers.count {
//            computers+=item
//            x+=1
//            }
//        }
//        return Text(computers)
//}
//}
    
    
struct ListView: View {
    @State private var searchTerm: String = ""
    @State private var array: [String] = []
    var body: some View {
  
        List {
            SearchBar(text: $searchTerm, array: $array)
            ForEach(array, id:\.self) { item in
                Text(item) + Text("Test")
            }
        }
    }
}
