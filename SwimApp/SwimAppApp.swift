//
//  SwimAppApp.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/11/26.
//

import SwiftUI

@main
struct SwimAppApp: App {
    @StateObject private var store = WorkoutStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store) // inject store into the view hierarchy
        }
    }
}
