//
//  ImageLoader.swift
//  WBChatAppSUI
//
//  Created by Daria on 29.07.2024.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?

    func loadImage(from name: String) {
        DispatchQueue.global().async {
            let image = Image(name)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
