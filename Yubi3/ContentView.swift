//
//  ContentView.swift
//  Yubi3
//
//  Created by Joe Blau on 9/20/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    let smartCard = SmartCard()
    @State var publicKey = ""
    
    var body: some View {
        List {
            Text(publicKey)
            Button {
                generatePublicKeyPair()
            } label: {
                Label("Generate Key Pair", systemImage: "key")
            }

        }
            .onAppear { onAppear() }
    }
    
    func onAppear() {
        publicKey = smartCard.publicKey?.hexDescription ?? "no public key"
    }
    
    func generatePublicKeyPair() {
        Task {
            do {
                try await smartCard.createKey()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
