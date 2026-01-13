//
//  WorkoutStore.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/12/26.
//

import SwiftUI
internal import Combine

@MainActor
class WorkoutStore: ObservableObject {
    
    @Published var workouts: [SwimWorkout] = []

    init() {
        // Optional: add a sample workout so you can see it immediately
        workouts = [
            SwimWorkout(
                title: "Sample Workout",
                date: Date(),
                sets: [
                    SwimSet(rounds: 2, instructions: [
                        SwimInstruction(reps: 4, distance: 100, stroke: .freestyle, interval: "1:30"),
                        SwimInstruction(reps: 2, distance: 50, stroke: .backstroke)
                    ])
                ]
            )
        ]
    }
}
