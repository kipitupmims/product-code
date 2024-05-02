import SwiftUI

struct Unrelated_Query: View {
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
            Text("This query isn't related to fitness. Try asking for running advice!")
                .multilineTextAlignment(.center)
                .lineLimit(5)
            
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
    Unrelated_Query(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", selectedQuery: "Default query", isOnboardingCompleted: false)
}
