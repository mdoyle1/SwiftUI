//
//  PageView.swift
//  csvSearch
//
//  Created by developer on 10/9/19.
//  Copyright © 2019 Toxicspu. All rights reserved.
//


import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        PageViewController(controllers: viewControllers)
    }
}

struct PageView_Preview: PreviewProvider {
    static var previews: some View {
        PageView(features.map { FeatureCard(landmark: $0) })
        .aspectRatio(3/2, contentMode: .fit)
    }
}
