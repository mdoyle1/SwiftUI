//
//  csvAccessability.swift
//  csvSearch
//
//  Created by developer on 10/8/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftCSV


var csvData:[[String]]!
var headers:[String] = []

var csvArray: [[String:String]] = [[:]]
func csvToList(){
         if let url = globalPathToCsv {
                     do {
                         print(url)
                         let csvFile: CSV = try CSV(url: globalPathToCsv)
                         let csv = csvFile
                         headers = csv.header
                        csvArray = csv.namedRows
                         print(headers)
                         print(csvArray[0][headers[0]] as Any)
                             } catch {print("contents could not be loaded")}}
                                else {print("the URL was bad!")}
  
    }


