//
//  SafariViewTest.swift
//  eWallet
//
//  Created by Habibur Rahman on 3/7/24.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}


struct TestSafariView : View {
    var body: some View {
        NavigationStack {
            NavigationLink("Push") {
                SafariWebView(url: URL(string: "https://sarunw.com")!)
                    .ignoresSafeArea()
            }
        }
    }
}
