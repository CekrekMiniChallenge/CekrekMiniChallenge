//
//  WatchConnectivityManager.swift
//  CekrekMiniChallenge
//
//  Created by Nadya Margareth Angkawijaya on 05/07/24.
//

import Foundation
import WatchConnectivity

class WatchConnectivityManager: NSObject, ObservableObject{
    
    static let shared = WatchConnectivityManager()
    
    @Published var isCaptured: Bool = false
    @Published var flash: Bool = false
    @Published var fiveSecTimer: Bool = false
    
    var session: WCSession
    var delegate: SessionDelegater?
    
    override init() {
        self.session = WCSession.default
        super.init()
        self.delegate = SessionDelegater(watchConnectivityManager: self, session: WCSession.default)
        self.session.delegate = self.delegate
        if WCSession.isSupported() {
            session.activate()
            print("Success")
        } else {
            print("WCSession is not supported on this device.")
        }
    }

    func sendMessage() {
        let message: [String: Any] = [
            "isCaptured": isCaptured,
            "flash": flash,
            "fiveSecTimer" : fiveSecTimer
        ]
        
        session.sendMessage(message, replyHandler: nil) { error in
            print("Error sending message: \(error.localizedDescription)")
        }
    }
    
    func flashTrigger(){
        if flash == false {
            self.flash = true
        } else if flash == true{
            self.flash = false
        }
        sendMessage()
    }
    
    func captured() {
        if isCaptured == true{
            self.isCaptured = false
        } else if isCaptured == false {
            self.isCaptured = true
        }
        sendMessage()
    }
    
    func fiveSecTrigger(){
        if fiveSecTimer == false{
            self.fiveSecTimer = true
        } else{
            self.fiveSecTimer = false
        }
        sendMessage()
    }
    
    func callFlash(){
        guard session.isReachable else {
            print("Watch is not reachable")
            return
        }
        
        let message: [String: Any] = ["function": "flash"]
        session.sendMessage(message, replyHandler: nil) { error in
            print("Error sending message to iPhone: \(error.localizedDescription)")
        }
    }
    
    func callCaptured(){
        guard session.isReachable else {
            print("Watch is not reachable")
            return
        }
        
        let message: [String: Any] = ["function": "captured"]
        session.sendMessage(message, replyHandler: nil) { error in
            print("Error sending message to iPhone: \(error.localizedDescription)")
        }
    }
    
    func callFiveSec(){
        guard session.isReachable else {
            print("Watch is not reachable")
            return
        }
        
        let message: [String: Any] = ["function": "fiveSec"]
        session.sendMessage(message, replyHandler: nil) { error in
            print("Error sending message to iPhone: \(error.localizedDescription)")
        }
    }
}

class SessionDelegater: NSObject, WCSessionDelegate {
    weak var watchConnectivityManager: WatchConnectivityManager?
    var session: WCSession?
    
//    init(watchConnectivityManager: WatchConnectivityManager?, session: WCSession?) {
//        self.watchConnectivityManager = watchConnectivityManager
//        self.session = session
//        super.init()
//        self.session?.delegate = self
//    }
    
    init(watchConnectivityManager: WatchConnectivityManager?, session: WCSession?) {
        self.watchConnectivityManager = watchConnectivityManager
        self.session = session
        super.init()
        self.session?.delegate = self
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        print("WC Session activation completed: \(activationState.rawValue)")
        if let error = error{
            print("WC session activation failed \(error.localizedDescription)")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let functionName = message["function"] as? String {
                switch functionName {
                case "captured":
                    self.watchConnectivityManager?.captured()
                case "flash":
                    self.watchConnectivityManager?.flashTrigger()
                case "fiveSec":
                    self.watchConnectivityManager?.fiveSecTrigger()
                default:
                    print("Unknown function name: \(functionName)")
                }
            }
            
            if let isCaptured = message["isCaptured"] as? Bool {
                self.watchConnectivityManager?.isCaptured = isCaptured
            }
            
            if let flash = message["flash"] as? Bool {
                self.watchConnectivityManager?.flash = flash
            }
            if let fiveSecTimer = message ["fiveSecTimer"] as? Bool {
                self.watchConnectivityManager?.fiveSecTimer = fiveSecTimer
            }
        }
    }
    
#if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // Activate the new session after having switched to a new watch.
        session.activate()
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
#endif
}
