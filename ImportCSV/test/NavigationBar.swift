//
//  NavigationBar.swift
//  test
//
//  Created by developer on 1/3/20.
//  Copyright © 2020 developer. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello World")
                }
            }
            .navigationBarTitle(Text("SwiftUI"))
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
