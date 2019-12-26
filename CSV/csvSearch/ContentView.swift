//
//  ContentView.swift
//  csvSearch
//
//  Created by developer on 10/7/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//
//https://www.appcoda.com/swiftui-first-look/
//https://fuckingswiftui.com
//https://blog.kaltoun.cz/swiftui-presenting-modal-sheet/


import SwiftUI
import UIKit
import Combine
import Foundation

var globalPathToCsv:URL!
var csvArray = [[String:String]]()
var csv = CSVaccessability()



func loadCSV(){
    csv.csvToList()
  // print(csvArray)
   
}
struct ContentView: View {
@EnvironmentObject var viewToggle: ToggleView
   // @State var items = headers
   // @State var showHeaders = true
    @State private var isPresented = false
    @State private var picker = false
  //  @State var switcher = Switcher
      var body: some View {
        VStack{
//            if self.switcher {
//                Text("Headers").bold()
//                List{
//               DISPLAYS ALL THE HEADERS AFTER SHOW LIST ITEMS IS PRESSED
//
//                    ForEach(headers.indices){ index in
//                        Toggle(isOn: self.$showHeaders) {
//                            Button(action: {print(headers[index])}){
//                                if self.showHeaders{
//                                Text(headers[index])}
//                               }
//                            }
//
//                        }
//                    }
//            }
                       Text("csvSearch")
                           Button(action: {self.isPresented = true
                            self.viewToggle.toggleView.toggle()
                           // self.switcher = true
                           })
                           {Text("import")
                           Image(systemName: "folder").scaledToFit()
                           }.sheet(isPresented: $isPresented) {
                               () -> DocumentPickerViewController in
                            DocumentPickerViewController.init()
                                                  }
            if self.picker {
                DocumentPickerViewController().environmentObject(ToggleView())
            }
            
            if self.viewToggle.toggleView{
                ListView()
                        }
                   }
               }
            }
                            
                    
            
struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView().environmentObject(ToggleView())
    }
}



/// Wrapper around the `UIDocumentPickerViewController`.
struct DocumentPickerViewController {
    private let supportedTypes: [String] = ["public.item"]
    // Callback to be executed when users close the document picker.
   // private let onDismiss: () -> Void
    func onDismiss(){
        //Switcher = true
   }
    init() {
        onDismiss()
     }

//    init(onDismiss: @escaping () -> Void) {
//        self.onDismiss = onDismiss
//    }
}


// MARK: - UIViewControllerRepresentable

extension DocumentPickerViewController: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIDocumentPickerViewController

    func makeUIViewController(context: Context) -> DocumentPickerViewController.UIViewControllerType {
        let documentPickerController = UIDocumentPickerViewController(documentTypes: supportedTypes, in: .import)
        documentPickerController.allowsMultipleSelection = false
        documentPickerController.delegate = context.coordinator
        
        return documentPickerController
    }

    func updateUIViewController(_ uiViewController: DocumentPickerViewController.UIViewControllerType, context: Context) {}

    // MARK: Coordinator

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate, ObservableObject {
       // @EnvironmentObject var syncList:
        var parent: DocumentPickerViewController

        init(_ documentPickerController: DocumentPickerViewController) {
            parent = documentPickerController
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
            globalPathToCsv = url
            loadCSV()
          }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onDismiss()
            
        }
    }
}
