//
//  GeneratedQRView.swift
//  QR_Generator
//
//  Created by Alumno on 21/10/21.
//

import SwiftUI

struct GeneratedQRView: View {
    
    var cantidad: String
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State var id = UUID().uuidString
    
    var body: some View {
        VStack {
            Image(uiImage: generateQRCode(from:"\(id)%\(cantidad)"))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
        }
        .onAppear {
            id = UUID().uuidString
            uploadToDatabase(id: id, cantidad: cantidad)
        }
    }
    
    func uploadToDatabase(id: String, cantidad: String) {
        // Codigo que sube a base de datos
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    
}

struct GeneratedQRView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedQRView(cantidad: "50")
    }
}
