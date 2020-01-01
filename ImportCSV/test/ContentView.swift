//
//  ContentView.swift
//  test
//
//  Created by developer on 12/26/19.
//  Copyright © 2019 developer. All rights reserved.
//



import SwiftUI
import UIKit
import Foundation

var globalPathToCsv:URL!

struct ContentView: View {
    @EnvironmentObject var viewToggle: ToggleView
    @State private var isPresented = false

    

      var body: some View {
        VStack{

                       Text("csvSearch")
                           Button(action: {self.isPresented = true
                           })
                           {Text("import")
                           Image(systemName: "folder").scaledToFit()
                           }.sheet(isPresented: $isPresented, onDismiss: {self.viewToggle.toggleView.toggle()}) {
                               () -> DocumentPickerViewController in
                            DocumentPickerViewController.init()
            }

            
            if viewToggle.toggleView {
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

    func onDismiss(){
        //Switcher = true
   }
    init() {
        onDismiss()
     }
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

    func updateUIViewController(_ uiViewController: DocumentPickerViewController.UIViewControllerType, context: Context) {
    
    }

    // MARK: Coordinator

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
     

        var parent: DocumentPickerViewController

        init(_ documentPickerController:
    
            DocumentPickerViewController ) {
            parent = documentPickerController
           
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
           
            globalPathToCsv = url
            csvToList()
        
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onDismiss()
            
        }
    }
}
