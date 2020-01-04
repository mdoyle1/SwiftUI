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
    @State private var selectedView = SelectedHeaderView()
    @State private var select = false
         @EnvironmentObject var viewToggle: ToggleView
    
    
    func buildHeaderList(header: String){
        if viewToggle.selectedHeaders.contains(header){
        viewToggle.selectedHeaders.removeAll{ $0 == header }
        } else {viewToggle.selectedHeaders.append(header)}
            print(viewToggle.selectedHeaders)
        
    if headerList.contains(header){
    headerList.removeAll{ $0 == header }
    } else {headerList.append(header)}
        print(headerList)
    }
    
    var body: some View {
        HStack{
        List {
            ForEach(headers, id:\.self) { header in
                 Button(action: {print(header)
                    self.buildHeaderList(header: header)
                    self.select = true
                    }) {
                    Text(header)
                     .background(Color.green) // 1. Change the background color to purple
                     .foregroundColor(.white)  // 2. Set the foreground/font color to white
                     .font(.title)             // 3. Change the font type
                     .padding()
                      }.listRowBackground(self.selectedHeader == header ? Color.blue : Color(UIColor.systemGroupedBackground))
            }
        }
            if self.select {
                viewToggle.selectedHeaderView
            }
        }
    }
}

struct SelectedHeaderView: View {
    @State private var selectedItems = headerList
     @EnvironmentObject var viewToggle: ToggleView
    var body: some View {
        List {
            ForEach(viewToggle.selectedHeaders, id:\.self) { header in
            Text(header)
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
