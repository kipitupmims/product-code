import SwiftUI

struct New_User_Splash: View {
    
    var isOnboardingCompleted: Bool
    
    init(isOnboardingCompleted: Bool) {
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Welcome to Kipitup!")
                    .fontWeight(.bold)
                    .font(.headline)
                    .position(x: 88 , y:-10)
                
                Text("Let's start with some basic information about you...")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                    .padding(.horizontal)
                    .frame(width: 200.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    .position(CGPoint(x: 88.0, y: 10.0))
                
                NavigationLink("Continue", destination: User_Onboarding_1(isOnboardingCompleted: isOnboardingCompleted))
                    .fontWeight(.semibold)
                    .cornerRadius(10)
                    .padding()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .position(x: 88, y: 40)
                
            }
        }
    }
}
    
struct New_User_Splash_Previews: PreviewProvider {
    static var previews: some View {
        New_User_Splash(isOnboardingCompleted: false)
    }
}
