
import SwiftUI

struct Processing_Query: View {
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
            Text("Hang tight. Your query is being processed.")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20.0)
            
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
    Processing_Query(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", selectedQuery: "Default query", isOnboardingCompleted: false)
}
