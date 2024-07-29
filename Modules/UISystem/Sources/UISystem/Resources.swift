//
//  Resources.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

public enum Resources {
    public enum DefaultStrings {
        public static let walkViewString1 = "Общайтесь с друзьями и близкими легко"
        public static let walkViewString2 = "Нажимая кнопку продолжить я соглашаюсь с"
        public static let walkViewString3 = "Политикой Конфиденциальности"
        public static let walkViewString4 = "и"
        public static let walkViewString5 = "Условиями Использования"
        public static let walkViewString6 = "Начать общаться"
        
        public static let verifViewString1 = "Введите номер телефона"
        public static let verifViewString2 = "Мы вышлем код подтверждения"
        public static let verifViewString3 = "на указаный номер"
        public static let verifViewString4 = "Введите номер телефона"
        public static let verifViewString5 = "Введите правильный номер телефона"
        public static let verifViewString6 = "Продолжить"
        
    }
    public enum Colors {
        public enum BrandColor {
            public static let bc_bg                  = Color("BC_BG")
            public static let bcDarkButtonOnPressed  = Color("BC_DarkButtonOnPressed")
            public static let bcDarkMode             = Color("BC_DarkMode")
            public static let bcDefaultButton        = Color("BC_DefaultButton")
            public static let bcLightVariant         = Color("BC_LightVariant")
        }
        
        public enum NeutralColor {
            public static let active            = Color("Neutral_Active")
            public static let bodyText          = Color("Neutral_BodyText")
            public static let darkMode          = Color("Neutral_DarkMode")
            public static let disabled          = Color("Neutral_Disabled")
            public static let lineForDivider    = Color("Neutral_LineForDivider")
            public static let secondaryBG       = Color("Neutral_SecondaryBG")
            public static let weakSecondaryText = Color("Neutral_WeakSecondaryText")
            public static let whiteForBG        = Color("Neutral_WhiteForBG")
        }
        
        public enum AccentColor {
            public static let danger  = Color("Accent_Danger")
            public static let safe    = Color("Accent_Safe")
            public static let success = Color("Accent_Success")
            public static let warning = Color("Accent_Warning")
        }
        
        public enum GradientColor {
            public static let gradient1_Dark  = Color("Gradient1_Dark")
            public static let gradient1_Light = Color("Gradient1_Light")
            public static let gradient2_Dark  = Color("Gradient2_Dark")
            public static let gradient2_Light = Color("Gradient2_Light")
        }
        

    }
    
    public enum ImageTitle {
        public enum DefaultImage {
            public static let Illustration  = "Illustration"
            public static let chevronLeft   = "variant=chevron_left"
        }
        public enum SystemImage {
            public static let tabBarPerson = "person.2"
            public static let tabBarChats  = "message"
            public static let tabBarMore   = "ellipsis"
            public static let tabBarCountries = "globe.asia.australia"
            public static let tabBarEmoji = "figure.walk.diamond.fill"
        }
        
        public enum FlagsImage {
            public static let AESizeS = "AESizeS"
            public static let AMSizeS = "AMSizeS"
            public static let AZSizeS = "AZSizeS"
            public static let BYSizeS = "BYSizeS"
            public static let CNSizeS = "CNSizeS"
            public static let GBSizeS = "GBSizeS"
            public static let GESizeS = "GESizeS"
            public static let KGSizeS = "KGSizeS"
            public static let KRSizeS = "KRSizeS"
            public static let KZSizeS = "KZSizeS"
            public static let RUSizeS = "RUSizeS"
            public static let TRSizeS = "TRSizeS"
            public static let USSizeS = "USSizeS"
            public static let UZSizeS = "UZSizeS"
        }
    }
}
