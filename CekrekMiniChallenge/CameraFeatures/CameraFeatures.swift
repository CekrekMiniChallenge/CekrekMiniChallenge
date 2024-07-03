//
//  FlashService.swift
//  CekrekMiniChallenge
//
//  Created by Fatakhillah Khaqo on 03/07/24.
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
}
