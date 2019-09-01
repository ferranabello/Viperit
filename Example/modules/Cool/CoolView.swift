//
//  CoolView.swift
//  Example
//
//  Created by Ferran on 17/06/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import SwiftUI

struct CoolViewModel {
    var name = ""
}

struct CoolView : View {
    weak var presenter: CoolPresenterApi?
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack(spacing: 10) {
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
            Text("SwiftUI is really amazing")
            Text("Random name: \(settings.randomName)")
            Text("Score: \(settings.score)")
            
            Button(action: { self.presenter?.changeScore() }) {
                Text("Add score +1")
            }
            Button(action: { self.presenter?.changeRandomName() }) {
                Text("Fetch new random name")
            }
        }
    }
}
