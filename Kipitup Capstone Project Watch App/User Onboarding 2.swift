import SwiftUI

struct User_Onboarding_2: View {
    var selectedGender: String
    var isOnboardingCompleted: Bool
    
    init(selectedGender: String, isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    @State private var weight = ""
    @State private var selectedWeight = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Enter Your Weight")
                    .font(.headline)
                    .position(x: 81 , y:-10)
                
//                TextField("Weight (kg)", text: $weight)
//                    .padding()
//                    .position(x: 81, y: 10)

                
                TextField("Weight (kg)", text: $weight)
                            .padding()
                            .position(x: 81, y: 0)
                            .onChange(of: weight) { newValue in
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
                
                
                NavigationLink("Continue", destination: User_Onboarding_3(selectedGender: selectedGender, selectedWeight: self.weight, isOnboardingCompleted: isOnboardingCompleted))
                    .fontWeight(.semibold)
                    .cornerRadius(10)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .position(x: 81, y: 30)
                    .disabled(showError)
                
                // Display the stored weight
                if !selectedWeight.isEmpty {
                    Text("Stored Weight: \(selectedWeight) kg")
//                        .padding(.top)
                }
                
            }
            .padding()
        }
    }
}


struct User_Onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        User_Onboarding_2(selectedGender: "Female", isOnboardingCompleted: false)
    }
}
