//
//  Resources.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

enum Resources {
    enum DefaultStrings {
        static let walkViewString1 = "Общайтесь с друзьями и близкими легко"
        static let walkViewString2 = "Нажимая кнопку продолжить я соглашаюсь с"
        static let walkViewString3 = "Политикой Конфиденциальности"
        static let walkViewString4 = "и"
        static let walkViewString5 = "Условиями Использования"
        static let walkViewString6 = "Начать общаться"
        
        static let verifViewString1 = "Введите номер телефона"
        static let verifViewString2 = "Мы вышлем код подтверждения"
        static let verifViewString3 = "на указаный номер"
        static let verifViewString4 = "Введите номер телефона"
        static let verifViewString5 = "Введите правильный номер телефона"
        static let verifViewString6 = "Продолжить"
        
    }
    enum Colors {
        enum BrandColor {
            static let bc_bg                  = Color("BC_BG")
            static let bcDarkButtonOnPressed  = Color("BC_DarkButtonOnPressed")
            static let bcDarkMode             = Color("BC_DarkMode")
            static let bcDefaultButton        = Color("BC_DefaultButton")
            static let bcLightVariant         = Color("BC_LightVariant")
        }
        
        enum NeutralColor {
            static let active            = Color("Neutral_Active")
            static let bodyText          = Color("Neutral_BodyText")
            static let darkMode          = Color("Neutral_DarkMode")
            static let disabled          = Color("Neutral_Disabled")
            static let lineForDivider    = Color("Neutral_LineForDivider")
            static let secondaryBG       = Color("Neutral_SecondaryBG")
            static let weakSecondaryText = Color("Neutral_WeakSecondaryText")
            static let whiteForBG        = Color("Neutral_WhiteForBG")
        }
        
        enum AccentColor {
            static let danger  = Color("Accent_Danger")
            static let safe    = Color("Accent_Safe")
            static let success = Color("Accent_Success")
            static let warning = Color("Accent_Warning")
        }
        
        enum GradientColor {
            static let gradient1_Dark  = Color("Gradient1_Dark")
            static let gradient1_Light = Color("Gradient1_Light")
            static let gradient2_Dark  = Color("Gradient2_Dark")
            static let gradient2_Light = Color("Gradient2_Light")
        }
        

    }
    
    enum ImageTitle {
        enum DefaultImage {
            static let Illustration  = "Illustration"
            static let chevronLeft   = "variant=chevron_left"
        }
        enum SystemImage {
            static let tabBarPerson = "person.2"
            static let tabBarChats  = "message"
            static let tabBarMore   = "ellipsis"
            static let tabBarCountries = "globe.asia.australia"
            static let tabBarEmoji = "figure.walk.diamond.fill"
        }
        
        enum FlagsImage {
            static let AESizeS = "AESizeS"
            static let AMSizeS = "AMSizeS"
            static let AZSizeS = "AZSizeS"
            static let BYSizeS = "BYSizeS"
            static let CNSizeS = "CNSizeS"
            static let GBSizeS = "GBSizeS"
            static let GESizeS = "GESizeS"
            static let KGSizeS = "KGSizeS"
            static let KRSizeS = "KRSizeS"
            static let KZSizeS = "KZSizeS"
            static let RUSizeS = "RUSizeS"
            static let TRSizeS = "TRSizeS"
            static let USSizeS = "USSizeS"
            static let UZSizeS = "UZSizeS"
        }
    }
}
