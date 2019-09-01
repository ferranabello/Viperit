//
//  UserSettings.swift
//  Example
//
//  Created by Ferran on 27/08/2019.
//  Copyright © 2019 Ferran Abelló. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var randomName = "random"
    @Published var score = 0
}
