
//
//  VerificationView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct VerificationView: View {
    @State var selectedCountry: Country = Country.countries.first(where: { $0.flagImage == Resources.ImageTitle.FlagsImage.RUSizeS })!
    @State var phoneNumber: String = "000 000-00-00"
    @State private var isPhoneNumberValid = true
    @State private var hasTappedTextField = false
    @State private var isShowingWarning = false
    @State private var isPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if !hasTappedTextField {
                    informationText
                        .padding(.bottom, 30)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.animation(.easeIn))
                        .onTapGesture {
                            withAnimation {
                                hasTappedTextField.toggle()
                            }
                        }
                }
                
                phoneInputSection
                
                if isShowingWarning {
                    warningText
                }
                
                Spacer()
                
                if !hasTappedTextField || phoneNumber.isEmpty {
                    Button(Resources.DefaultStrings.verifViewString6) {
                    }
                    .buttonStyle(StatefulButtonStyle(size: CGSize(width: 327, height: 52), state: .fillDisabled))
                    .padding(.bottom, 30)
                } else {
                    Button(Resources.DefaultStrings.verifViewString6) {
                        if !isPhoneNumberValid {
                            isShowingWarning.toggle()
                        } else {
                            isPresented.toggle()
                        }
                    }
                    .buttonStyle(StatefulButtonStyle(size: CGSize(width: 327, height: 52), state: .fillNormal))
                    .padding(.bottom, 30)
                }
            }
            .navigationBarBackButtonHidden()
            .contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.endEditing(true)
                hasTappedTextField.toggle()
            }
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
            .navigationDestination(isPresented: $isPresented) {
                VerificationCodeView(phoneNumber: phoneNumber)
            }
        }
    }
    
    private var informationText: some View {
        VStack(spacing: 8) {
            Text(Resources.DefaultStrings.verifViewString1)
                .textStyle(with: .neading2)
                .foregroundColor(Resources.Colors.NeutralColor.active)
            Text(Resources.DefaultStrings.verifViewString2)
                .foregroundColor(Resources.Colors.NeutralColor.active)
                .textStyle(with: .bodyText2)
            Text(Resources.DefaultStrings.verifViewString3)
                .foregroundColor(Resources.Colors.NeutralColor.active)
                .textStyle(with: .bodyText2)
        }
    }
    
    private var phoneInputSection: some View {
        HStack {
            CustomPicker(countries: Country.countries, selectedCountry: $selectedCountry)
            
            TextField(Resources.DefaultStrings.verifViewString4, text: $phoneNumber)
                .multilineTextAlignment(.leading)
                .padding(.leading, 8)
                .frame(width: 262, height: 36)
                .background(Resources.Colors.NeutralColor.secondaryBG)
                .cornerRadius(4)
                .textStyle(with: .bodyText1)
                .foregroundColor(Resources.Colors.NeutralColor.disabled)
                .keyboardType(.phonePad)
                .onTapGesture {
                    if !hasTappedTextField {
                        phoneNumber = ""
                        hasTappedTextField.toggle()
                    }
                    isShowingWarning = false
                }
                .onChange(of: phoneNumber) { newValue in
                    phoneNumber = newValue.formattedAsPhoneNumber()
                    validatePhoneNumber()
                    if newValue.isEmpty {
                        isShowingWarning = false
                    }
                }
        }
    }
    
    private var warningText: some View {
        Text(Resources.DefaultStrings.verifViewString5)
            .foregroundColor(Resources.Colors.AccentColor.danger)
            .textStyle(with: .bodyText1)
    }
    
    private func validatePhoneNumber() {
        let numberWithoutCountryCode = phoneNumber
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
        
        isPhoneNumberValid = numberWithoutCountryCode.count == selectedCountry.phoneLength
    }
}

struct CustomPicker: View {
    var countries: [Country]
    @Binding var selectedCountry: Country
    
    var body: some View {
        Menu {
            ForEach(countries) { country in
                Button(action: {
                    selectedCountry = country
                }) {
                    HStack {
                        Image(country.flagImage)
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text(country.code)
                            .textStyle(with: .bodyText1)
                    }
                }
            }
        } label: {
            HStack {
                Image(selectedCountry.flagImage)
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(selectedCountry.code)
                    .textStyle(with: .bodyText1)
                    .foregroundColor(Resources.Colors.NeutralColor.disabled)
            }
            .frame(width: 65, height: 36)
            .background(Resources.Colors.NeutralColor.secondaryBG)
            .cornerRadius(4)
        }
    }
}


struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
