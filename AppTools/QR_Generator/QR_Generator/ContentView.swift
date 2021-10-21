//
//  ContentView.swift
//  QR_Generator
//
//  Created by Alumno on 18/10/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State private var showingAlert = false
    @State var cantidad: String = ""
    @State var num: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Cantidad", text: $cantidad)
                    .frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                NavigationLink(destination: GeneratedQRView(cantidad: cantidad)) {
                    Image(systemName: "plus.square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(20)
                }
            }
            .navigationBarTitle("Generador", displayMode: .inline)
        }
    }
    
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
