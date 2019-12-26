//
//  PageViewController.swift
//  csvSearch
//
//  Created by developer on 10/9/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//


import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
           let pageViewController = UIPageViewController(
               transitionStyle: .scroll,
               navigationOrientation: .horizontal)

           return pageViewController
       }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
           pageViewController.setViewControllers(
               [controllers[0]], direction: .forward, animated: true)
       }
    
}
