//
//  Pose.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 06/07/24.
//

import Foundation
import SwiftUI

enum Value: CaseIterable {
    case confident
    case strong
    case friendly
    case genuine
    
    var imgRaw : [String] {
        switch self {
        case .confident:
            ["Confident1","Confident2","Confident3"]
        case .strong:
            ["Strong1","Strong2","Strong3",]
        case .friendly:
            ["Friendly1","Friendly2","Friendly3",]
        case .genuine:
            ["Genuine1","Genuine2","Genuine3",]
        }
    }
    
    var imgOutline : [String] {
        switch self {
        case .confident:
            ["ConfidentOutline1","ConfidentOutline2","ConfidentOutline3"]
        case .strong:
            ["StrongOutline1","StrongOutline2","StrongOutline3",]
        case .friendly:
            ["FriendlyOutline1","FriendlyOutline2","FriendlyOutline3",]
        case .genuine:
            ["GenuineOutline1","GenuineOutline2","GenuineOutline3",]
        }
    }
    
    var imgSample : [String] {
        switch self {
        case .confident:
            ["ConfidentSample1","ConfidentSample2","ConfidentSample3"]
        case .strong:
            ["StrongSample1","StrongSample2","StrongSample3",]
        case .friendly:
            ["FriendlySample1","FriendlySample2","FriendlySample3",]
        case .genuine:
            ["GenuineSample1","GenuineSample2","GenuineSample3",]
        }
    }
}

enum Confident {
    case first
    case second
    case third
}

enum Strong {
    case first
    case second
    case third
}

enum Friendly {
    case first
    case second
    case third
}

enum Genuine {
    case first
    case second
    case third
}
