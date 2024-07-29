//
//  VerificationCodeView.swift
//  WBChatAppSUI
//
//  Created by Daria on 04.07.2024.
//

import SwiftUI
import UISystem

struct Authorization {
    var number: String
    var code: Int
}

struct AuthorizationCollection {
    var authorizations: [Authorization]
    
    static var shared = AuthorizationCollection(authorizations: [
        Authorization(number: "900 900-90-90", code: 1234),
        Authorization(number: "999 999-99-99", code: 1235)
    ])
    
    mutating func addAuthorization (number: String) -> Authorization {
        let generatCode = generatorCode()
        let newAuthorization = Authorization(number: number, code: generatCode)
        authorizations.append(newAuthorization)
        return newAuthorization
    }
    
    private func generatorCode() -> Int {
        return Int.random(in: 1000...9999)
    }
}

extension AuthorizationCollection: Sequence {
    func makeIterator() -> Array<Authorization>.Iterator {
        return authorizations.makeIterator()
    }
}

infix operator <<: AdditionPrecedence

extension AuthorizationCollection {
    static func << (collection: AuthorizationCollection, phoneNumber: String) -> [Authorization] {
        return collection.authorizations.filter { $0.number == phoneNumber }
    }
}

struct VerificationCodeView: View {
    @Environment(\.dismiss) var dismiss
    var phoneNumber: String
    
    @State private var codeElements = Array(repeating: "", count: 4)
    @State private var isCodeValid = false
    @State private var showError = false
    
    @State private var authorization: Authorization?
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Введите код")
                    .textStyle(with: .neading2)
                    .padding(.bottom, 8)
                Text("Отправили код на номер")
                    .textStyle(with: .bodyText2)
                    .padding(.bottom, 2)
                Text("+7 \(phoneNumber)")
                    .textStyle(with: .bodyText2)
                    .padding(.bottom, 49)
                
                HStack(spacing: 40) {
                    ForEach(0..<4) { index in
                        CustomTextField(text: $codeElements[index])
                            .onChange(of: codeElements[index], perform: { _ in updateCodeAuthorization() })
                    }
                }
                
                if showError {
                    Text("Неверный код. Попробуйте еще раз.")
                        .foregroundColor(Resources.Colors.AccentColor.danger)
                        .padding()
                }
                
                Button("Запросить код повторно") {
                }
                .buttonStyle(StatefulButtonStyle(size: CGSize(width: 327, height: 52), state: .normal))
                
                .navigationBarBackButtonHidden()
                .padding(.leading,24)
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
            .navigationDestination(isPresented: $isCodeValid) {
                UserDetailsView()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.endEditing(true)
            }
            .onAppear {
                setupAuthorization()
            }
        }
    }
    
    private func setupAuthorization() {
        if let existingAuthorization = AuthorizationCollection.shared.authorizations.first(where: { $0.number == phoneNumber }) {
            authorization = existingAuthorization
        } else {
            let newAuthorization = AuthorizationCollection.shared.addAuthorization(number: phoneNumber)
            authorization = newAuthorization
            print(newAuthorization.code)
        }
    }
    
    private func updateCodeAuthorization() {
        let codeAuthorization = codeElements.joined()
        
        if codeAuthorization.count == 4, let code = Int(codeAuthorization) {
            if checkAuthorization(number: phoneNumber, code: code) {
                isCodeValid = true
                showError = false
            } else {
                isCodeValid = false
                showError = true
            }
            codeElements = Array(repeating: "", count: 4)
        }
    }
    
    private func checkAuthorization(number: String, code: Int) -> Bool {
        let matchingAuthorizations = AuthorizationCollection.shared << number
        return matchingAuthorizations.contains { $0.code == code }
    }
    
    struct CustomTextField: View {
        @Binding var text: String
        @FocusState private var isFocused: Bool
        
        var body: some View {
            TextField("", text: $text)
                .textStyle(with: .neading1)
                .frame(width: 32, height: 40)
                .multilineTextAlignment(.center)
                .keyboardType(.phonePad)
                .focused($isFocused)
                .onChange(of: text) { newValue in
                    if newValue.count > 1 {
                        text = String(newValue.prefix(1))
                        
                    }
                }
                .background(
                    ZStack {
                        if !isFocused && text.isEmpty {
                            Circle()
                                .foregroundColor(Resources.Colors.NeutralColor.lineForDivider)
                                .frame(width: 24, height: 24)
                        }
                    })
                .onTapGesture {
                    isFocused = true
                }
        }
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView(phoneNumber: "999 999-99-99")
    }
}
