//
//  ViewControllerResolver.swift
//  bookswap
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//  https://github.com/Geri-Borbas/iOS.Blog.SwiftUI_Search_Bar_in_Navigation_Bar
//
import SwiftUI

final class ViewControllerResolver: UIViewControllerRepresentable {
    
    let onResolve: (UIViewController) -> Void
        
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
    }
    
    func makeUIViewController(context: Context) -> ParentResolverViewController {
        ParentResolverViewController(onResolve: onResolve)
    }
    
    func updateUIViewController(_ uiViewController: ParentResolverViewController, context: Context) { }
}

class ParentResolverViewController: UIViewController {
    
    let onResolve: (UIViewController) -> Void
    
    init(onResolve: @escaping (UIViewController) -> Void) {
        self.onResolve = onResolve
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Use init(onResolve:) to instantiate ParentResolverViewController.")
    }
        
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        // Show the search bar initially but still allow it to hide when scrolling.
         UIView.performWithoutAnimation {
            parent?.navigationItem.searchController?.isActive = true
            parent?.navigationItem.searchController?.isActive = false
        }
        
        if let parent = parent {
            onResolve(parent)
        }
    }
    
}
