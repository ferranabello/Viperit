//
//  CoolView.swift
//  Example
//
//  Created by Ferran on 17/06/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import SwiftUI

struct CoolView : View {
    let presenter: CoolPresenterApi
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            Text("SwiftUI is really amazing")
            Button(action: {
                self.showAlert = true
            }) {
                Text("What's my name?")
            }
            .presentation($showAlert) {
                Alert(title: Text("Hi there"), message: Text("Your name is \(presenter.whatsMyName())"))
            }
        }
    }
}
