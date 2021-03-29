//
//  ContentView.swift
//  animalSounds
//
//  Created by Seth Rodgers on 3/19/21.
//

import SwiftUI
import CoreGraphics


//struct Profile {
//    var username: String
//    var password: String
//    var joinDate = Date()
//
//    static let `default` = Profile(username: "user123", password: "123")
//}
















struct ContentView: View {
    var body: some View {
    
        NavigationView{
            
            pageOne().navigationBarTitle("Animal Sounds", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//PAGE ONE
struct pageOne: View{
    
    
    @State var username: String = ""
    @State var password: String = ""
    var isLoggedin:Bool = false

    
    
    var body: some View{
        
        
        
        VStack{
            
            Text("").navigationBarTitle("Animal Sounds")
            
            //USERNAME
            TextField("Username", text: $username)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                .cornerRadius(8.0)
                .padding()
            
            //PASSWORD
            SecureField("Password", text: $password)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                .cornerRadius(8.0)
                .padding()
            
            NavigationLink(destination: pageTwo()){
                Text("Login")
            }
        }
    }
}



//PAGE TWO - HOME PAGE
struct pageTwo: View{
    var body: some View{
        
        VStack{
            Text("").navigationBarTitle("Home page")
            
            NavigationLink(destination: pageThree()){
                Text("Classification Page")
            }
            NavigationLink(destination: pageFour()){
                Text("Profile Page")
            }
            NavigationLink(destination: pageFive()){
                Text("Model Info")
            }
            NavigationLink(destination: pageSix()){
                Text("Statistics")
            }
            
            
        }
    }
}



//PAGE THREE - CLASSIFICATION PAGE
struct pageThree: View{
    var body: some View{
        
        VStack{
            Text("Classification Page").navigationBarTitle("Classification Page")
        }
    }
}



//PAGE FOUR - PROFILE PAGE
struct pageFour: View{
    var body: some View{
        
        VStack{
            Text("Profile Page").navigationBarTitle("Profile Page")
            //Text("Username: \(draftProfile.username)")

        }
    }
}



//PAGE FIVE - MODEL INFO
struct pageFive: View{
    var body: some View{
        
        VStack{
            Text("Page Five").navigationBarTitle("Page five")

        }
    }
}



//PAGE SIX - STATISTICS
struct pageSix: View{
    var body: some View{
        
        VStack{
            Text("").navigationBarTitle("Statistics")

        }
    }
}
