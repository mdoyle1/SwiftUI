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
var headerList:[String] = []


//Build a header list to sort data.
func buildHeaderList(header: String){
if headerList.contains(header){
headerList.removeAll{ $0 == header }
} else {headerList.append(header)}
    print(headerList)
}

//building the list for the ListView() to display
//takes csvArray and appends each item to formatedList
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

struct HeaderView: View {
    @State private var selectedHeader: String?
    var body: some View {
        List {
            ForEach(headers, id:\.self) { header in
                 Button(action: {print(header)
                    buildHeaderList(header: header)
                    }) {
                    Text(header)
                     .background(Color.green) // 1. Change the background color to purple
                     .foregroundColor(.white)  // 2. Set the foreground/font color to white
                     .font(.title)             // 3. Change the font type
                     .padding()
                      }.listRowBackground(self.selectedHeader == header ? Color.blue : Color(UIColor.systemGroupedBackground))
            }
        }
    }
}


//This ListView presents the search Data...
//Create another list view to display
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
