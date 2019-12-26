//
//  AssetInventoryRow.swift
//  csvSearch
//
//  Created by developer on 12/3/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct AssetInventoryRow: View {
    @Published var inventory = TestData
    var body: some View {
      //  Text($inventory[0]["Alternate Barcode"])
    }
}

struct AssetInventoryRow_Previews: PreviewProvider {
    static var previews: some View {
        AssetInventoryRow()
    }
}
