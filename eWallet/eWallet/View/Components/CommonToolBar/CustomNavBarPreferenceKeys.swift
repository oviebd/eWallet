//
//  CustomNavBarPreferenceKeys.swift
//  eWallet
//
//  Created by Habibur Rahman on 29/3/24.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKey : PreferenceKey {
    
    static var defaultValue : String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarBackButtonHiddenPreferenceKey : PreferenceKey {
    
    static var defaultValue : Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    
//    .navigationTitle("Title 2")
//    .navigationBarBackButtonHidden(false)
    
    func customNavigationTitle(_ title : String) -> some View {
        preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
    }
    
    func customNavigationBarBackButtonHidden(_ hidden : Bool) -> some View {
        preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNavBarItems(title : String = "", backButtonHidden : Bool = false) -> some View{
        self
            .customNavigationTitle(title)
            .customNavigationBarBackButtonHidden(backButtonHidden)
    }
    
}
