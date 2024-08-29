//
//  ChatsScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI
import ExyteChat

struct ChatsScreen: View {
    @State var messages: [Message] = []

    var body: some View {
        ChatView(messages: messages) { draft in
            send(draft: draft)
        }
    }

    func send(draft: DraftMessage) {
        let newMessage = Message(id: UUID().uuidString, user: User(id: UUID().uuidString, name: "Ivan", avatarURL: nil, isCurrentUser: true), text: draft.text)
        messages.append(newMessage)
    }
}

struct ChatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatsScreen()
    }
}
