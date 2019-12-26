//
//  HeaderRow.swift
//  csvSearch
//
//  Created by developer on 11/27/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct AssetInventoryRow: View {
    var inventory: Inventory
    var body: some View {
        Text(headersTest[0])
      //  Text(TestData[1].description)
    }
}

struct HeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        HeaderRow()
    }
}
