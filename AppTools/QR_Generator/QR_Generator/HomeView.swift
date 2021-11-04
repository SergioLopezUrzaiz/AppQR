//
//  HomeView.swift
//  QR_Generator
//
//  Created by Alumno on 01/11/21.
//

import SwiftUI

struct HomeView: View {
    
    var username: String = "A00827462"
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: GeneratedQRView(username: username)) {
                    Text("Generar QR")
                }
                NavigationLink(destination: ScanQRView()) {
                    Text("Escanear QR")
                }
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
