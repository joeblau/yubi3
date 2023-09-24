//
//  SmartCard.swift
//  Yubi3
//
//  Created by Joe Blau on 9/20/23.
//

import Foundation
import YubiKit

class SmartCard: NSObject {

    var connection: YKFSmartCardConnection?
    var publicKey: Data?
    
    override init() {
        super.init()
        switch YubiKitDeviceCapabilities.supportsSmartCardOverUSBC {
        case true:
            print("Smart Card: 🟢")
            YubiKitManager.shared.delegate = self
            YubiKitManager.shared.startSmartCardConnection()

        case false:
            print("Smart Card: 🛑")
        }
    }
    
    func createKey()  async throws {
        switch connection {
        case let .some(connection):
            guard let smartCardInterface = connection.smartCardInterface else { /* Connection has closed */ return }

            print("Generated Key")
        case .none:
            print("Not Connected")
        }
    }
    
    func getKey() async throws {
        switch connection {
        case let .some(connection):
            let session = try await connection.pivSession()
            

        case .none:
            print("Not Connected")
        }
    }
}


extension SmartCard: YKFManagerDelegate {
    func didConnectNFC(_ connection: YKFNFCConnection) {
        print("didConnectNFC")
    }
    
    func didDisconnectNFC(_ connection: YKFNFCConnection, error: Error?) {
        print("didDisconnectNFC")
    }
    
    func didConnectAccessory(_ connection: YKFAccessoryConnection) {
        print("didConnectAccessory")
    }
    
    func didDisconnectAccessory(_ connection: YKFAccessoryConnection, error: Error?) {
        print("didDisconnectAccessory")
    }
    
    func didConnectSmartCard(_ connection: YKFSmartCardConnection) {
        print("didConnectSmartCard")
        self.connection = connection
    }
}
