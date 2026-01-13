//
//  WorkoutEditorView.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/12/26.
//

import SwiftUI

struct WorkoutEditorView: View {
    @Binding var workout: SwimWorkout
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                workoutInfoSection
                setsSection
            }
            .navigationTitle("Edit Workout")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

private extension WorkoutEditorView {
    var workoutInfoSection: some View {
        Section("Workout Info") {
            TextField("Workout Title", text: $workout.title)
            DatePicker("Date", selection: $workout.date, displayedComponents: .date)
        }
    }
}

private extension WorkoutEditorView {
    var setsSection: some View {
        Section("Sets") {
            ForEach($workout.sets) { $set in
                SwimSetEditorView(set: $set)
            }
            .onDelete(perform: deleteSet)

            Button {
                addSet()
            } label: {
                Label("Add Set", systemImage: "plus")
            }
        }
    }

    func addSet() {
            let newSet = SwimSet(rounds: 1, instructions: [])
            workout.sets.append(newSet)
        }

    func deleteSet(at offsets: IndexSet) {
        workout.sets.remove(atOffsets: offsets)
    }
}
