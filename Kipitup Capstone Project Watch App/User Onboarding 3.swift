import SwiftUI

struct User_Onboarding_3: View {
    var selectedGender: String
    var selectedWeight: String
    var isOnboardingCompleted: Bool
    
    init(selectedGender: String, selectedWeight: String, isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.selectedWeight = selectedWeight
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    @State private var age = ""
    @State private var selectedAge = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Enter Your Age")
                    .font(.headline)
                    .position(x: 81 , y:-10)
                
                TextField("Age", text: $age)
                    .padding()
                    .position(x: 81, y: 0)
                    .onChange(of: age) { newValue in
                        if newValue.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
                            showError = true
                        } else {
                            showError = false
                        }
                    }
                
                if showError {
                    Text("Please enter numerical characters only.")
                        .foregroundColor(.red)
                        .font(.system(size: 11))
                        .multilineTextAlignment(.center)
                }
                
                NavigationLink("Continue", destination: User_Onboarding_4(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: self.age, isOnboardingCompleted: isOnboardingCompleted))
                    .fontWeight(.semibold)
                    .cornerRadius(10)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .position(x: 81, y: 30)
                    .disabled(showError)
                
                // Display the stored age
                if !selectedAge.isEmpty {
                    Text("Stored Age: \(selectedAge)")
                        .padding(.top)
                }
            }
            .padding()
        }
    }
}
struct User_Onboarding_3_Previews: PreviewProvider {
    static var previews: some View {
        User_Onboarding_3(selectedGender: "Female", selectedWeight: "50", isOnboardingCompleted: false)
    }
}
