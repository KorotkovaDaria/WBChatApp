//
//  ButtonMedia.swift
//  
//
//  Created by Daria on 16.07.2024.
//

import SwiftUI

public struct ButtonMedia: View {
    let label: String
    
    public init(label: String) {
        self.label = label
    }
    public var body: some View {
        Button {
            //do someting
        } label: {
            Image(label)
        }
        .buttonStyle(StatefulButtonStyle(size: CGSize(width: 72, height: 40), state: .borderNormal))
    }
}
