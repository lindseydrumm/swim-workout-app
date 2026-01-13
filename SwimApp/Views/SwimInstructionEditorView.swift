//
//  SwimInstructionEditorView.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/12/26.
//

import SwiftUI

struct SwimInstructionEditorView: View {
    @Binding var instruction: SwimInstruction

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("Reps")
                Spacer()
                TextField("1", value: $instruction.reps, format: .number)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Distance")
                Spacer()
                TextField("100", value: $instruction.distance, format: .number)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
            }

            Picker("Stroke", selection: $instruction.stroke) {
                ForEach(SwimStroke.allCases) { stroke in
                    Text(stroke.displayName).tag(stroke)
                }
            }

            TextField("Interval (optional)", text: Binding(
                get: { instruction.interval ?? "" },
                set: { instruction.interval = $0.isEmpty ? nil : $0 }
            ))

            TextField("Notes (optional)", text: Binding(
                get: { instruction.notes ?? "" },
                set: { instruction.notes = $0.isEmpty ? nil : $0 }
            ))
        }
        .padding(.vertical, 5)
    }
}
