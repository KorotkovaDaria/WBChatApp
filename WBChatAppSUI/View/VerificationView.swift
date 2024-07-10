//
//  VerificationView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(Resources.ImageTitle.DefaultImage.chevronLeft)
                    }
                }
            }
        }
    }
}


struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
