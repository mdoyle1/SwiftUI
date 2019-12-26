//
//  ListView.swift
//  csvSearch
//
//  Created by developer on 12/12/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI

var arrayOfData = [Container]()
var arrayer = [Stack<Any>]()
struct ListView: View {
 
@EnvironmentObject var syncList: ToggleView
@State private var searchTerm: String = ""
@State private var array: [Container] = []

        func arrayFiller(){
        if arrayOfData.count > 0 {
            arrayOfData.removeAll()
        }

        for item in csvArray {
            arrayer.append(Stack())
            arrayOfData.append(Container(
                barcode: item["Barcode"],
                model: item["Model"],
                description: item["ASDescription"],
                serial: item["Asset Serial No"],
                building: item["Building"],
                floor: item["Floor"],
                room: item["Room"]))
        }
          
    }
    
    init() {
        UITableView.appearance().separatorColor = .clear
        //Build list of headers using the top view.
        arrayFiller()
      }
    
    
    
    var body: some View {
  
    
        List {
            SearchBar(text: $searchTerm, array: $array)
            ForEach(array, id:\.self){item in
            Text("\(item.barcode ?? "")\n\(item.model ?? "")\n\(item.serial ?? "")")}
            }
        }
}
