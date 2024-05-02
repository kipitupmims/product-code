//
//  test.swift
//  Elevate Capstone Project Watch App
//
//  Created by Kripa Sitaraman on 2/28/24.
//

import SwiftUI

struct View2: View {
    @Binding var push: Bool

    var body: some View {
        ZStack {
            Color.yellow
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.push.toggle()
                }
            }) {
                Text("POP")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct View1: View {
    @Binding var push: Bool
    
    var body: some View {
        ZStack {
            Color.green
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    self.push.toggle()
                }
            }) {
                Text("PUSH")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}


struct ContentView: View {
    @State private var push = false

    var body: some View {
        ZStack {
            if !push {
                View1(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if push {
                View2(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



//struct test: View
//
//{
//    @State private var showView = "LoginView"
//    
//    var body: some View
//    {
//        switch showView
//        {
//        case "LoginView":
//            Text("Please login.")
//            Button("Login")
//            {
//                showView = "NormalView"
//            }
//        case "NormalView":
//            Text("This is youre NormalView!")
//            Button("Next view")
//            {
//                showView = "NextView"
//            }
//        case "NextView":
//            Text("This is the NextView")
//            Button("Back")
//            {
//                showView = "NormalView"
//            }
//        default:
//            Text("Default") // you should never reach this
//        }
//    }
//}
//    
    

#Preview {
    ContentView()
}
