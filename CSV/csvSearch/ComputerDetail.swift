//
//  ComputerDetail.swift
//  csvSearch
//
//  Created by developer on 12/16/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import SwiftUI
//
//struct ComputerDetail: View {
//    // Data passed from parent list view
//    @Binding var computer: ComputerViewModel
//
//    // SwiftUI form with data fields
//    // note the autocapitalization and keyboard modifiers
//
//    var body: some View {
//        VStack {
//            Form {
//                Section(header: Text("Barcode")) {
//                    TextField("Enter Barcode", text: $computer.barcode)
//                        .autocapitalization(.words)
//                }
//
//                Section(header: Text("Model")) {
//                    TextField("Enter model name", text: $computer.model)
//                        .autocapitalization(.words)
//                }
//
//                Section(header: Text("Description")) {
//                    TextField("Enter Description", text: $computer.description)
//                        .keyboardType(.phonePad)
//                }
//
//                Section(header: Text("Serial")) {
//                    TextField("Address", text: $computer.serial)
//                        .autocapitalization(.words)
//                }
//                Section(header: Text("Building")) {
//                                  TextField("Building", text: $computer.building)
//                                      .autocapitalization(.words)
//                              }
//                Section(header: Text("Floor")) {
//                                  TextField("Floor", text: $computer.floor)
//                                      .autocapitalization(.words)
//                              }
//                Section(header: Text("Room")) {
//                                  TextField("Room", text: $computer.room)
//                                      .autocapitalization(.words)
//                              }
//            }
//        }
//    }
//
//    // Formatter for registration date
//    var dateFormatter: DateFormatter {
//        let df = DateFormatter()
//        df.timeStyle = .short
//        df.dateStyle = .long
//        return df
//    }
//}
//
//// Previewing requires using .constant to convert the data to a binding
//// Sample data is generated in an extension in Preview Content
//
//struct PersonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let person = ComputerViewModel.
//        return PersonDetailView(person: .constant(person))
//    }
//}
