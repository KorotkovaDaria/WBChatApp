//
//  ContentView.swift
//  HTTP-Cats-App
//
//  Created by Daria on 08.08.2024.
//

import SwiftUI

struct ContentView: View {
    private var networkManager = NetworkManager()
    @State private var image: UIImage?
    @State private var httpCode: Int = 200 // Код состояния по умолчанию
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading...")
            }
            
            TextField("Enter HTTP Code", value: $httpCode, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Load Image") {
                networkManager.loadPicture(httpCode: httpCode) { loadedImage in
                    self.image = loadedImage
                }
            }
            .padding()
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
