//
//  CSVDocumentPicker.swift
//  csvSearch
//
//  Created by developer on 10/12/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//
import Combine
import SwiftUI

class Switcher: ObservableObject {
var didChange = PassthroughSubject<Bool, Never>()
  var isEnabled = false {
      didSet {
          didChange.send(self.isEnabled)
      }
  }
}


struct CSVDocumentPicker: View {
  @EnvironmentObject var switcher:Switcher
    @State private var isPresented = false
   
    var body: some View {
        VStack{
            Text("csvSearch")
                Button(action: {self.isPresented = true
                })
                {Text("import")
                Image(systemName: "folder").scaledToFit()
                }.sheet(isPresented: $isPresented) {
                    () -> DocumentPickerViewController in
                    DocumentPickerViewController.init(onDismiss: {
                    self.isPresented = false
                    })
            }
            if switcher.isEnabled  {
                        ListView()
                     }
            
        }
    }
}

struct CSVDocumentPicker_Previews: PreviewProvider {
    static var previews: some View {
        CSVDocumentPicker().environmentObject(Switcher())
    }
}
/// Wrapper around the `UIDocumentPickerViewController`.
struct DocumentPickerViewController {
  
    private let supportedTypes: [String] = ["public.item"]

    // Callback to be executed when users close the document picker.
    private let onDismiss: () -> Void

    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
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

    func updateUIViewController(_ uiViewController: DocumentPickerViewController.UIViewControllerType, context: Context) {}

    // MARK: Coordinator

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate, ObservableObject {
        @EnvironmentObject var switcher:Switcher
        var parent: DocumentPickerViewController

        init(_ documentPickerController: DocumentPickerViewController) {
            parent = documentPickerController
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
            
            globalPathToCsv = url
            loadCSV()
           
         switcher.isEnabled.toggle()
          }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onDismiss()
            
        }
    }
}
