//
//  FeatureModel.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 04/07/24.
//

import Foundation

class CameraFeatures : ObservableObject {
    @Published var showFlash = false
    @Published var countdown: Int? = nil
    @Published var timer: Timer? = nil
}

enum Features{
    case flash
    case timer
    case pose
    case none
}

enum Duration {
    case off
    case five
    case ten
}

enum Flash{
    case off
    case on
}
