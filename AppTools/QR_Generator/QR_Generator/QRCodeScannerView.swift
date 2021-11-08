//
//  QRCodeScannerView.swift
//  QR_Generator
//
//  Created by Alumno on 04/11/21.
//
import SwiftUI
import CodeScanner

struct QrCodeScannerView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started"
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            } )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Scan QR Code") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
            Button {
                print("Subido :)")
            } label: {
                Image(systemName: "arrow.up.and.person.rectangle.portrait")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }
        }
    }
   
    
}

struct QRCodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeScannerView()
    }
}
