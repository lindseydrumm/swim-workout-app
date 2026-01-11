import Foundation

enum Stroke : String, CaseIterable, Identifiable {
    case freestyle, backstroke, butterfly, breastroke, individualMedley, choice
    var id : String { rawValue }
}

enum Equipment : String, CaseIterable, Identifiable {
    case none, paddles, fins, pullBuoy, snorkel, kickboard
    var id : String { rawValue }
}

struct SwimInstruction {
    var reps : Int
    var distance : Int
    var stroke : Stroke   // could be optional
    var interval : String
    var notes : String?
    var equipment : [Equipment]?
}

struct SwimSet {
    var rounds : Int
    var instructions : SwimInstruction
}

struct SwimWorkout {
    var title : String
    var date : Date
    var sets : [SwimSet]
}