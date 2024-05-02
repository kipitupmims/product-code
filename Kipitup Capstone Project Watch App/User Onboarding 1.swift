import SwiftUI

public func printSystemFonts() {
    // Use this identifier to filter out the system fonts in the logs.
    let identifier: String = "[SYSTEM FONTS]"
    // Here's the functionality that prints all the system fonts.
    for family in UIFont.familyNames as [String] {
        debugPrint("\(identifier) FONT FAMILY :  \(family)")
        for name in UIFont.fontNames(forFamilyName: family) {
            debugPrint("\(identifier) FONT NAME :  \(name)")
        }
    }
}

struct User_Onboarding_1: View {
    
    var isOnboardingCompleted: Bool
    
    init(isOnboardingCompleted: Bool) {
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    @State private var selectedGenderIndex = 0
    let genders = ["Male", "Female", "Other"]
    @State private var selectedGender: String = ""
    
    var body: some View {
        
        NavigationStack{
            VStack {
                Text("Select Your Gender")
                    .font(.headline)
                    .position(x: 88 , y:-10)
                
                Picker(selection: $selectedGenderIndex, label: Text("")) {
                    ForEach(0..<genders.count, id: \.self) { index in
                        Text(self.genders[index])
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 0.0/*@END_MENU_TOKEN@*/)
                .frame(width: 180.0, height: 100.0)
                .position(x: 88 , y:-5)
                
                NavigationLink("Continue", destination: User_Onboarding_2(selectedGender: self.genders[selectedGenderIndex], isOnboardingCompleted: isOnboardingCompleted))
                    .fontWeight(.semibold)
                    .cornerRadius(10)
                    .padding()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .position(x: 88, y: 30)
                
                

            }
        }
    }
}
   struct User_Onboarding_1_Previews: PreviewProvider {
       static var previews: some View {
           User_Onboarding_1(isOnboardingCompleted: false)
       }
   }
