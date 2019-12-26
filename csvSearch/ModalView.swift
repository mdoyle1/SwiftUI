//
//  ModalView.swift
//  csvSearch
//
//  Created by developer on 10/10/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI

struct ModalView: View {
  @EnvironmentObject var myData: MyData
    @State private var showTable = false
    var body: some View {
        HStack{
            Button(action: {
                                    self.showTable = true
                                }) {
                                    Text("Show modal")
                                }.sheet(isPresented: self.$showTable) {
                                    ModalViewContent()
                                //Test()
                                 }
        }
    }
}

struct ModalViewContent: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    Group {
      Text("Modal view")
      Button(action: {
         self.presentationMode.wrappedValue.dismiss()
      }) {
        Text("Dismiss")
      }
    }
  }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
