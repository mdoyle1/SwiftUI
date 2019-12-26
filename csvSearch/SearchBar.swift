//
//  SearchBar.swift
//  csvSearch
//
//  Created by developer on 12/6/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var array: [Container]
    
    class Coordinator: NSObject, UISearchBarDelegate, ObservableObject {
     
        @Binding var text: String
        @Binding var array: [Container]
        
        init(text: Binding<String>, array: Binding<[Container]>) {
            _text = text
            _array = array
        }
        
         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
        array = [Container]()
      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
        self.array = arrayOfData.filter {
            self.text.isEmpty ? true : (($0.barcode?.localizedCaseInsensitiveContains(self.text))!)}
            }
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, array: $array)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    
    }
}
