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

enum duration {
    case off
    case five
    case ten
}

enum flash{
    case off
    case on
}
