//
//  rowView.swift
//  csvSearch
//
//  Created by developer on 12/9/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct rowView: View {
    var testData = TestData
    
    var body: some View {
        Text("\(TestData[2]["Barcode"] ?? "")")
        ForEach(csvArray, id: \.id) { result in
            Text("Result: \(testData[result]["Barcode"])")
                }
    }
}

struct rowView_Previews: PreviewProvider {
    static var previews: some View {
        rowView()
    }
}
