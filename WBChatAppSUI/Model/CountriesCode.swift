//
//  CountriesCode.swift
//  WBChatAppSUI
//
//  Created by Daria on 04.07.2024.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let code: String
    let phoneLength: Int
    let flagImage: String
    
    static let countries = [
            Country(code: "+971", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.AESizeS),
            Country(code: "+374", phoneLength: 8, flagImage: Resources.ImageTitle.FlagsImage.AMSizeS),
            Country(code: "+994", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.AZSizeS),
            Country(code: "+375", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.BYSizeS),
            Country(code: "+86", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.CNSizeS),
            Country(code: "+44", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.GBSizeS),
            Country(code: "+995", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.GESizeS),
            Country(code: "+996", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.KGSizeS),
            Country(code: "+82", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.KRSizeS),
            Country(code: "+7", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.KZSizeS),
            Country(code: "+7", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.RUSizeS),
            Country(code: "+90", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.TRSizeS),
            Country(code: "+1", phoneLength: 10, flagImage: Resources.ImageTitle.FlagsImage.USSizeS),
            Country(code: "+998", phoneLength: 9, flagImage: Resources.ImageTitle.FlagsImage.UZSizeS)
            ]
}
