//
//  TestRun.swift
//  csvSearch
//
//  Created by developer on 12/3/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var label: String
    var isOn: Bool {
        didSet {
            // Added to show that state is being modified
            print("\(label) just toggled")
        }
    }
}

class Service: ObservableObject {
    @Published var items: [Item]

    init() {
        self.items = [
            Item(id: "0", label: "Zero", isOn: false),
            Item(id: "1", label: "One", isOn: true),
            Item(id: "2", label: "Two", isOn: false)
        ]
    }
}


struct TestRun: View {
       @ObservedObject var service: Service
    var body: some View {
       List {
                   ForEach(service.items.indices, id: \.self) { index in
                       Section(header: Text(self.service.items[index].label)) {
                           Toggle(isOn: self.$service.items[index].isOn) {
                               Text("isOn")
                           }
                       }
                   }
               }
               .listStyle(GroupedListStyle())
           }
    }


struct TestRun_Previews: PreviewProvider {
    static var previews: some View {
        TestRun(service:  )
    }
}

