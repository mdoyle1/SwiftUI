//
//  Row.swift
//  csvSearch
//
//  Created by developer on 10/10/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct Row: View {
    var data = csvArray[0]
    var body: some View {
        HStack{
          //  Text(String(data[0]))
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(data: csvArray[0])
    }
}
