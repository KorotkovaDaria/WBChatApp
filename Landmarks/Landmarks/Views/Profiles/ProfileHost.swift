import SwiftUI

struct ProfileHost: View {
    @Environment (\.editMode) var editMode
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button("Cancel", role: .cancel) {
                    if editMode?.wrappedValue == .active {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    } else {
                        dismiss()
                    }
                }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
