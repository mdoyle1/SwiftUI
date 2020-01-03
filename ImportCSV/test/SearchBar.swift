//
//  SearchBar.swift
//  test
//
//  Created by developer on 1/2/20.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import SwiftUI


struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var array: [String]
    
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        @Binding var array: [String]
       
        init(text: Binding<String>, array: Binding<[String]>) {
            _text = text
            _array = array
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            array = []
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
//            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
                  self.array = formatedList.filter {
                    self.text.isEmpty ? true : (($0.localizedCaseInsensitiveContains(self.text)))}
                      }
                  }
        
    }
    
  
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, array: $array)
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
}
