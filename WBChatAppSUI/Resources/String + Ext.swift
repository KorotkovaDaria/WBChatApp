//
//  String + Ext.swift
//  WBChatAppSUI
//
//  Created by Daria on 09.07.2024.
//

import Foundation

extension String {
    func formattedAsPhoneNumber() -> String {
        let cleanNumber = self.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        let mask = "XXX XXX-XX-XX"
        var result = ""
        var index = cleanNumber.startIndex

        for ch in mask where index < cleanNumber.endIndex {
            if ch == "X" {
                result.append(cleanNumber[index])
                index = cleanNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
