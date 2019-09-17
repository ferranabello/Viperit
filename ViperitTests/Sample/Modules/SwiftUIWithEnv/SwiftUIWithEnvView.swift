//
//  SwiftUIWithEnvView.swift
//  Viperit
//
//  Created by Ferran on 16/09/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import SwiftUI
import Viperit

class Settings: ObservableObject {
    @Published var text = "hi"
}

//MARK: SwiftUIWithEnvView SwiftUI
struct SwiftUIWithEnvView : View {
    weak var presenter: SwiftUIWithEnvPresenterApi?
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        Text(settings.text)
    }
}
