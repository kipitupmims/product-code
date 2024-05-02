import SwiftUI

struct Voice_Input: View {
    var selectedGender: String
    var selectedWeight: String
    var selectedAge: String
    var selectedHeight: String
    var isOnboardingCompleted: Bool
    
    @State private var query = ""
    @State private var selectedQuery = ""
    @State private var fitnessRelated = true
    @State private var QueryStatus: Int?
    @State private var sendButtonClicked = false
    
    var Concatenated_Variable: String {
        "Gender: \(selectedGender) | Weight (kg): \(selectedWeight) | Age: \(selectedAge) | Height (cm): \(selectedHeight) | Query: \(query)"
    }
    
    init(selectedGender: String, selectedWeight: String, selectedAge: String, selectedHeight: String, isOnboardingCompleted: Bool) {
        self.selectedGender = selectedGender
        self.selectedWeight = selectedWeight
        self.selectedAge = selectedAge
        self.selectedHeight = selectedHeight
        self.isOnboardingCompleted = isOnboardingCompleted
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter Your Query")
                    .font(.headline)
                    .position(x: 81 , y:-10)
                
                TextField("", text: $query)
                    .padding()
                    .position(x: 81, y: 10)
               
                Image("microphone")
                    .renderingMode(.original)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .colorInvert()
                    .position(x: 135, y: -15)
                
                HStack {
                    NavigationLink(destination: Main_Screen(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, isOnboardingCompleted: isOnboardingCompleted)) {
                        Text("Back")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                    .frame(width: 65.0)
                    
                    
                    if !sendButtonClicked {
                        Button(action: {
                            sendButtonClicked = true
                            sendDataToAWS(variable: self.Concatenated_Variable) { statusCode, responseData, error in
                                if let error = error {
                                    print("Error sending data to AWS: \(error)")
                                } else {
                                    if let statusCode = statusCode {
                                        print("Status Code:", statusCode)
                                        if statusCode == 201 {
                                            print("201")
                                            self.fitnessRelated.toggle()
                                        }
                                        // Update QueryStatus here
                                        self.QueryStatus = statusCode
                                    }
                                    if let responseData = responseData {
                                        // Process the response data here
                                        let responseString = String(data: responseData, encoding: .utf8) ?? ""
                                        print("Response from AWS Lambda: \(responseString)")

                                        // Extract status code from the response string
                                        if let range = responseString.range(of: "\"statusCode\":\\s*(\\d+)", options: .regularExpression) {
                                            let statusCodeString = responseString[range].replacingOccurrences(of: "\"statusCode\": ", with: "")
                                            if let statusCode = Int(statusCodeString) {
                                                print("Query Status Code:", statusCode)
                                                // Update QueryStatus here
                                                self.QueryStatus = statusCode
                                            } else {
                                                print("Failed to extract status code from response string")
                                            }
                                        } else {
                                            print("Status code not found in the response string")
                                        }
                                    }
                                }
                            }
                        }) {
                            Text("Send")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.green)
                    }

                    if let statusCode = QueryStatus, statusCode == 201 {
                        NavigationLink(destination: Unrelated_Query(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, selectedQuery: self.query, isOnboardingCompleted: isOnboardingCompleted)) {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        }
                        .foregroundColor(.green)
                        
//                        .frame(width: 95.0)
                    } else if sendButtonClicked {
                        NavigationLink(destination: Processing_Query(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, selectedQuery: self.query, isOnboardingCompleted: isOnboardingCompleted)) {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        }
//                        .frame(width: 95.0)
                        .foregroundColor(.green)
                    }
                }
                
                
                
            }
            .padding()
        }
    }
}


enum AWSRequestError: Error {
    case invalidStatusCode(Int)
    case responseParsingError(Error)
}


func sendDataToAWS(variable: String, completion: @escaping (Int?, Data?, Error?) -> Void) {

//    printSystemFonts()
    
    let awsURLString = "https://0tfmwzoboe.execute-api.us-east-2.amazonaws.com/new_dev_stage?WatchPrompt=\(variable)"
    
    guard let awsURL = URL(string: awsURLString) else {
        completion(nil, nil, nil)
        return
    }
    
    var request = URLRequest(url: awsURL)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(nil, nil, error)
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(nil, nil, nil)
            return
        }
        
        if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
            completion(httpResponse.statusCode, data, nil)
        } else {
            completion(nil, nil, AWSRequestError.invalidStatusCode(httpResponse.statusCode))
        }
    }
    task.resume()
}

struct Voice_Input_Previews: PreviewProvider {
    static var previews: some View {
        Voice_Input(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", isOnboardingCompleted: false)
    }
}



//
//
//import SwiftUI
//
//struct Voice_Input: View {
//    var selectedGender: String
//    var selectedWeight: String
//    var selectedAge: String
//    var selectedHeight: String
//    var isOnboardingCompleted: Bool
//    
//    @State private var query = ""
//    @State private var selectedQuery = ""
//    
//    var Concatenated_Variable: String {
//        "Gender: \(selectedGender) | Weight (kg): \(selectedWeight) | Age: \(selectedAge) | Height (cm): \(selectedHeight) | Query: \(query)"
//    }
//    
//    init(selectedGender: String, selectedWeight: String, selectedAge: String, selectedHeight: String, isOnboardingCompleted: Bool) {
//        self.selectedGender = selectedGender
//        self.selectedWeight = selectedWeight
//        self.selectedAge = selectedAge
//        self.selectedHeight = selectedHeight
//        self.isOnboardingCompleted = isOnboardingCompleted
//    }
//    
//    var body: some View {
//        NavigationStack{
//            VStack {
//                Text("Enter Your Query")
//                    .font(.headline)
//                    .position(x: 81 , y:-10)
//                
//                TextField("", text: $query)
//                    .padding()
//                    .position(x: 81, y: 10)
//               
//                Image("microphone")
//                    .renderingMode(.original)
//                    .resizable(resizingMode: .stretch)
//                    .aspectRatio(contentMode: .fit)
//                    .colorInvert()
//                    .position(x: 135, y: -25)
//                
//                NavigationLink(destination:
//                    Processing_Query(selectedGender: selectedGender, selectedWeight: selectedWeight, selectedAge: selectedAge, selectedHeight: selectedHeight, selectedQuery: self.query, isOnboardingCompleted: isOnboardingCompleted)
//                        .onAppear {
//                            // Action to send data to AWS when the destination view appears
//                            sendDataToAWS(variable: self.Concatenated_Variable) { error in
//                                if let error = error {
//                                    print("Error sending data to AWS: \(error)")
//                                } else {
//                                    print("Data sent to AWS successfully!")
//                                }
//                            }
//                        }
//                ) {
//                    Text("Continue")
//                        .fontWeight(.semibold)
//                        .cornerRadius(10)
//                        .padding()
//                }
//                .fontWeight(.semibold)
//                .cornerRadius(10)
//                .navigationBarTitle("")
//                .navigationBarHidden(true)
//                .position(x: 81, y: 28)
//                
//            }
//            .padding()
//        }
//    }
//}
//
//
//enum AWSRequestError: Error {
//    case invalidStatusCode(Int)
//}
//
//func sendDataToAWS(variable: String, completion: @escaping (Error?) -> Void) {
//    // AWS endpoint URL
////    let awsURLString = "https://0tfmwzoboe.execute-api.us-east-2.amazonaws.com/dev_kipitup?WatchPrompt=\(variable)"
////
//    let awsURLString = "https://0tfmwzoboe.execute-api.us-east-2.amazonaws.com/new_dev_stage?WatchPrompt=\(variable)"
//    
//    guard let awsURL = URL(string: awsURLString) else {
//        completion(nil)
//        return
//    }
//    
//    var request = URLRequest(url: awsURL)
//    request.httpMethod = "GET"
//    
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            completion(error)
//            return
//        }
//        
//        guard let httpResponse = response as? HTTPURLResponse else {
//            completion(nil)
//            return
//        }
//        
//        if httpResponse.statusCode == 200 {
//            completion(nil) // Data sent successfully
//        } else {
//            completion(AWSRequestError.invalidStatusCode(httpResponse.statusCode))
//        }
//    }
//    task.resume()
//}
//
//struct Voice_Input_Previews: PreviewProvider {
//static var previews: some View {
//    Voice_Input(selectedGender: "Female", selectedWeight: "50", selectedAge: "18", selectedHeight: "120", isOnboardingCompleted: false)
//}
//}
