import SwiftUI

struct Main_Screen: View {
    var selectedGender: String
    var selectedWeight: String
    var selectedAge: String
    var selectedHeight: String
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = true
    
    init(selectedGender: String, selectedWeight: String, selectedAge: String, selectedHeight: String, isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.selectedWeight = selectedWeight
        self.selectedAge = selectedAge
        self.selectedHeight = selectedHeight
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    var body: some View {
        
        NavigationStack{
            VStack {
                HStack{
                    Text("Welcome to")
                        .foregroundColor(.orange)
                        .position(x: 47, y: -10)
                }
                
                Text("Kipitup")
                    .font(.system(size: 35))
                    .position(x: 52, y: -20)
                
                HStack{
                    Rectangle()
                        .frame(width: 23.0, height: 2.0)
                        .position(x:14, y:-33)
                    Rectangle()
                        .frame(width: 45.0, height: 2.0)
                        .position(x:-32, y:-33)
                }

                Image("bars")
                    .position(x: 88, y: -15)
                    
                HStack {
                    NavigationLink("Ask me", destination: Voice_Input(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, isOnboardingCompleted: isOnboardingCompleted))
                        .fontWeight(.semibold)
                        .cornerRadius(10)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .position(x: 89, y: 19)
                    
                    //testing aws stuff with new button, can delete later no problemz
                    
//                    NavigationLink("AWS testing", destination: Test_2_URLSession(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight))
//                        .padding(.horizontal)
//                        .buttonBorderShape(/*@PLACEHOLDER=shape: ButtonBorderShape@*/.capsule)
//                        .buttonStyle(/*@PLACEHOLDER=Button Style@*/DefaultButtonStyle())
//                        .navigationBarTitle("")
//                        .navigationBarHidden(true)
//                        .position(x: 95, y: 25)
                    
                }
                
            }
            
        }
        }

}

#Preview {
    Main_Screen(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", isOnboardingCompleted: false)
}
