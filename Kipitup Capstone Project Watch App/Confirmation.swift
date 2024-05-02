
import SwiftUI

struct Confirmation: View {
    var selectedGender: String
    var selectedWeight: String
    var selectedAge: String
    var selectedHeight: String
    var selectedQuery: String
    var isOnboardingCompleted: Bool
    
    init(selectedGender: String, selectedWeight: String, selectedAge: String, selectedHeight: String, selectedQuery: String, isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.selectedWeight = selectedWeight
        self.selectedAge = selectedAge
        self.selectedHeight = selectedHeight
        self.selectedQuery = selectedQuery
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    var body: some View {
        NavigationStack{
            Text("Your training routine has been sent to your email.")
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .padding(.horizontal)
            
            NavigationLink("Return", destination: Main_Screen(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, isOnboardingCompleted: isOnboardingCompleted))
                .cornerRadius(10)
                .position(x: 90, y: 70)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .fontWeight(.semibold)

        }
    }
}

#Preview {
    Confirmation(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", selectedQuery: "Default query", isOnboardingCompleted: false)
}
