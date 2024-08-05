//
//  ProfileImageView.swift
//  
//
//  Created by Daria on 16.07.2024.
//

import SwiftUI

public struct ProfileImageView: View {
    let avatar: String?
    
    public init(avatar: String?) {
            self.avatar = avatar
        }
    
    public var body: some View {
        Group {
            if let avatar = avatar {
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image("Change Avatar")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
}
