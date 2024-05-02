//
//  User Onboarding 4.swift
//  Elevate Capstone Project Watch App
//
//  Created by Kripa Sitaraman on 3/6/24.
//

import SwiftUI

struct User_Onboarding_4: View {
    var selectedGender: String
    var selectedWeight: String
    var selectedAge: String
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    init(selectedGender: String, selectedWeight: String, selectedAge: String,  isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.selectedWeight = selectedWeight
        self.selectedAge = selectedAge
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    @State private var height = ""
    @State private var selectedHeight = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Enter Your Height")
                    .font(.headline)
                    .position(x: 81 , y:-10)
                
                TextField("Height (cm)", text: $height)
                    .padding()
                    .position(x: 81, y: 0)
                    .onChange(of: height) { newValue in
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
                
                NavigationLink("Continue", destination: Main_Screen(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: self.height, isOnboardingCompleted: isOnboardingCompleted))
//                    .onAppear {
//                        isOnboardingCompleted = true
//                    }
                    .onTapGesture {
                        // Toggle isOnboardingCompleted when the "Continue" button is tapped
                        isOnboardingCompleted = false
                    }
                    .fontWeight(.semibold)
                    .cornerRadius(10)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .position(x: 81, y: 30)
                    .disabled(showError)
                    
                
                // Display the stored height
                if !selectedHeight.isEmpty {
                    Text("Stored Height: \(selectedHeight) cm")
                        .padding(.top)
                }
            }
            .padding()
        }
    }
}
struct User_Onboarding_4_Previews: PreviewProvider {
static var previews: some View {
    User_Onboarding_4(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", isOnboardingCompleted: false)
}
}
