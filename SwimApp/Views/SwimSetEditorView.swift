//
//  SwimSetEditorView.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/12/26.
//

import SwiftUI

struct SwimSetEditorView: View {
    @Binding var set: SwimSet

    var body: some View {
        Section {
            Stepper("Rounds: \(set.rounds)", value: $set.rounds, in: 1...10)
            
            // Instructions
            ForEach($set.instructions) { $instruction in
                SwimInstructionEditorView(instruction: $instruction)
            }
            .onDelete(perform: deleteInstruction)
            
            Button {
                addInstruction()
            } label: {
                Label("Add Instruction", systemImage: "plus")
            }

//            Picker("Stroke", selection: $set.stroke) {
//                ForEach(SwimStroke.allCases) { stroke in
//                    Text(stroke.displayName).tag(stroke)
//                }
//            }
//
//            TextField("Interval", text: Binding(
//                get: { set.interval ?? "" },
//                set: { set.interval = $0.isEmpty ? nil : $0 }
//            ))
//
//            TextField("Notes (optional)", text: Binding(
//                get: { set.notes ?? "" },
//                set: { set.notes = $0.isEmpty ? nil : $0 }
//            ))
        }
    }
    
    func addInstruction() {
        let newInstruction = SwimInstruction(
            reps: 0,
            distance: 100,
            stroke: .freestyle,
            interval: nil,
            notes: nil,
            equipment: []
        )
        set.instructions.append(newInstruction)
    }

    func deleteInstruction(at offsets: IndexSet) {
        set.instructions.remove(atOffsets: offsets)
    }
}
