import SwiftUI

struct Fonts {
    let BangersRegular: String = "Bangers-Regular"
}


@main
struct Kipitup_Capstone_Project_Watch_AppApp: App {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isOnboardingCompleted: $isOnboardingCompleted,
                        selectedGender: "Male",
                        selectedWeight: "70",
                        selectedAge: "30",
                        selectedHeight: "180")
        }
    }
}

struct ContentView: View {
    @Binding var isOnboardingCompleted: Bool
    
    var selectedGender: String
    var selectedWeight: String
    var selectedAge: String
    var selectedHeight: String
    
    var body: some View {
        if isOnboardingCompleted == true {
            Main_Screen(selectedGender: selectedGender,
                        selectedWeight: selectedWeight,
                        selectedAge: selectedAge,
                        selectedHeight: selectedHeight,
                        isOnboardingCompleted: true)
        } else {
            New_User_Splash(isOnboardingCompleted: isOnboardingCompleted)
        }
    }
}

