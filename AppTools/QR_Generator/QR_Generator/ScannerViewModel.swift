//
//  ScannerViewModel.swift
//  QR_Generator
//
//  Created by Alumno on 04/11/21.
//

import Foundation

class ScannerViewModel: ObservableObject {
    
    /// Defines how often we are going to try looking for a new QR-code in the camera feed.
    let scanInterval: Double = 1.0
    
    @Published var torchIsOn: Bool = false
    @Published var lastQrCode: String = "Qr-code goes here"
    
    
    func onFoundQrCode(_ code: String) {
        self.lastQrCode = code
    }
}