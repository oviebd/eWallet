//
//  WebViewTest.swift
//  eWallet
//
//  Created by Habibur Rahman on 21/3/24.
//

import SwiftUI
import WebKit

struct WebViewTest: View {
    @State private var isLoading = true
    @State private var error: Error? = nil
  //  @State var urlString = "https://www.swiftyplace.com"//"https://payment.ekshop.live/ekshop-payment/a2itxzre/RT51711KMRKTXJ1710928513"
    
    @State var urlString = "https://payment.ekshop.live/ekshop-payment/a2itxzre/RT51711KMRKTXJ1710928513"

    var body: some View {
        ZStack{
        
            if let error = error {
                Text(error.localizedDescription)
                                    .foregroundColor(.pink)
            }
            
            
            if let url =  URL(string: urlString){
                WebView(url: url, isLoading: $isLoading, error: $error)
                    .edgesIgnoringSafeArea(.all)
                if isLoading {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    WebViewTest()
}

struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        var wkwebView = WKWebView()
        wkwebView.navigationDelegate = context.coordinator
        wkwebView.load(URLRequest(url: url))
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.body.style.webkitTouchCallout='none';")
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
                    print("loading error: \(error)")
                    parent.isLoading = false
                    parent.error = error
                }
        
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
             print("U>> Req Urls \(navigationAction.request.url)")
            //decisionHandler(.allow)
        }
    }
}


