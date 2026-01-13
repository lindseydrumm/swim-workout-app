//
//  SwimWorkout.swift
//  SwimApp
//
//  Created by Lindsey Drumm on 1/12/26.
//

import Foundation

enum SwimStroke : String, CaseIterable, Identifiable, Codable {
    case freestyle, backstroke, butterfly, breaststroke, individualMedley, choice
    var id : String { rawValue }
    var displayName: String {
        switch self {
        case .freestyle: return "Freestyle"
        case .backstroke: return "Backstroke"
        case .breaststroke: return "Breaststroke"
        case .butterfly: return "Butterfly"
        case .individualMedley: return "IM"
        case .choice : return "Choice"
        }
    }
}

enum Equipment : String, CaseIterable, Identifiable, Codable {
    case none, paddles, fins, pullBuoy, snorkel, kickboard
    var id : String { rawValue }
}

struct SwimInstruction : Identifiable, Codable {
    let id = UUID()
    
    var reps : Int
    var distance : Int
    var stroke : SwimStroke   // could be optional
    var interval : String?
    var notes : String?
    var equipment : [Equipment]?
}

struct SwimSet : Identifiable, Codable {
    let id = UUID()
    
    var rounds : Int
    var instructions : [SwimInstruction]
}

struct SwimWorkout : Identifiable, Codable {
    let id = UUID()
    
    var title : String
    var date : Date
    var sets : [SwimSet]
}
