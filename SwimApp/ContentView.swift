//
//  ContentView.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/11/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: WorkoutStore
    @State private var selectedWorkout: SwimWorkout?

    var body: some View {
        NavigationStack {
            List {
                ForEach($store.workouts) { $workout in
                    NavigationLink(workout.title) {
                        WorkoutEditorView(workout: $workout)
                    }
                }
                .onDelete { indexSet in
                    store.workouts.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Swim Workouts")
            .toolbar {
                Button {
                    addWorkout()
                } label: {
                    Label("Add Workout", systemImage: "plus")
                }
            }
        }
    }

    func addWorkout() {
        let newWorkout = SwimWorkout(title: "New Workout", date: Date(), sets: [])
        store.workouts.append(newWorkout)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WorkoutStore())
    }
}

#Preview {
    ContentView()
}
