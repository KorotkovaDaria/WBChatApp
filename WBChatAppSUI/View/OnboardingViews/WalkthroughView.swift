//
//  WalkthroughView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI
import UISystem

struct WalkthroughView: View {
    
    @State var isPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(Resources.ImageTitle.DefaultImage.Illustration)
                    .resizable()
                    .frame(width: 262, height: 271)
                    .padding(42)
                Text(Resources.DefaultStrings.walkViewString1)
                    .textStyle(with: .neading2)
                    .foregroundColor(Resources.Colors.NeutralColor.active)
                Spacer()
                Spacer()
                
                VStack {
                    Text(Resources.DefaultStrings.walkViewString2)
                        .textStyle(with: .metadata2)
                        .foregroundColor(Resources.Colors.NeutralColor.weakSecondaryText)
                        .padding(1)
                    
                    HStack(spacing: 3) {
                        Button(Resources.DefaultStrings.walkViewString3) {
                            //do something
                        }
                        .textStyle(with: .metadata2)
                        .foregroundColor(Resources.Colors.BrandColor.bcDefaultButton)
                        
                        Text(Resources.DefaultStrings.walkViewString4)
                            .textStyle(with: .metadata2)
                            .foregroundColor(Resources.Colors.NeutralColor.weakSecondaryText)
                        
                        Button(Resources.DefaultStrings.walkViewString5) {
                            //do something
                        }
                        .textStyle(with: .metadata2)
                        .foregroundColor(Resources.Colors.BrandColor.bcDefaultButton)
                    }
                    .padding(.bottom, 12)
                    
                    Button(Resources.DefaultStrings.walkViewString6) {
                        isPresented.toggle()
                    }
                    .buttonStyle(StatefulButtonStyle(size: CGSize(width: 327, height: 52), state: .fillNormal))
                }
                Spacer()
                    .navigationDestination(isPresented: $isPresented) {
                        VerificationView()
                    }
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}
