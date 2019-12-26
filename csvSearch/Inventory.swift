//
//  Inventory.swift
//  csvSearch
//
//  Created by developer on 12/3/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI
struct Inventory: Hashable, Codable  {
    var assetSerialNumber: String
    var barcode: String
    var manufacturer: String
    var model: String
    var assetName: String
    var alternateBarcode: String
    
}
