//
//  PageControlView.swift
//  CarCatalogueSwiftUI
//
//  Created by Tanmay Khopkar on 21/04/25.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.currentPageIndicatorTintColor = UIColor(Color.pageControllerCurrent)
        control.pageIndicatorTintColor = UIColor(Color.pageControllerTint)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = numberOfPages
        uiView.currentPage = currentPage
    }
}

