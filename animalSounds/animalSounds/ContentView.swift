//
//  ContentView.swift
//  animalSounds
//
//  Created by Seth Rodgers on 3/19/21.
//

import SwiftUI
import CoreGraphics


class GlobalVars: ObservableObject {
    @Published var username = ""
    @Published var password = ""
}

public var myUsername = ""
public var myPassword = ""















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
    
    @ObservedObject var globalVar = GlobalVars()
    
    
    @State var userInput: String = ""
    @State var passInput: String = ""
    
    @State var user: String = ""
    @State var pass: String = ""
    
    var isLoggedin:Bool = false
    @State var GoToView2:Bool = false
    @State var accountCreated:Bool = false
    

    
    
    var body: some View{
        
        
        
        VStack{
            
            Text("").navigationBarTitle("Animal Sounds")
            
            //USERNAME
            TextField("Username", text: $userInput)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                .cornerRadius(8.0)
                .padding()
            
            //PASSWORD
            SecureField("Password", text: $passInput)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                .cornerRadius(8.0)
                .padding()
            
            
            
            
            
            NavigationLink(destination: {
                VStack{
                    if user == userInput && pass == passInput && accountCreated {
                        pageTwo()
                    } else {
                        pageSeven()
                    }
                }
            }()) { // open ProjectsView only if the user clicked on the item "Projects" of the list etc..
                Text("Login")
                    .frame(width: 150, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8.0)
                    .padding(.top, 30.0)
                
            }
            
            Button(action: {
                print("Button clicked")
                user = userInput
                pass = passInput
                
                myUsername = userInput
                myPassword = passInput
                
                accountCreated = true
                
            }) {
                Text("Create Account")
                    .frame(width: 150, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8.0)
                    //.padding(.leading, 200.0)
                
            }.padding()
            
            
            
            
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
                    .padding()
                    .frame(width: 250, height: 80, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
            }
            NavigationLink(destination: pageFour()){
                Text("Profile Page")
                    .padding()
                    .frame(width: 250, height: 80, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
                    .padding(.top, 20.0)
            }
            NavigationLink(destination: pageFive()){
                Text("Model Info")
                    .padding()
                    .frame(width: 250, height: 80, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
                    .padding(.top, 20.0)
                
            }
            NavigationLink(destination: pageSix()){
                Text("Statistics")
                    .padding()
                    .frame(width: 250, height: 80, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
                    .padding(.top, 20.0)
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
            Text("Username: \(myUsername)")
            Text("Password: \(myPassword)")

        }
    }
}



//PAGE FIVE - MODEL INFO
struct pageFive: View{
    var body: some View{
        
        VStack{
            Text("Model Info").navigationBarTitle("Model Info")
            
        }
    }
}



//PAGE SIX - STATISTICS
struct pageSix: View{
    var body: some View{
        
        VStack{
            Text("Statistics").navigationBarTitle("Statistics")
            
        }
    }
}



//PAGE SEVEN - INCORRECT LOGIN
struct pageSeven: View{
    var body: some View{
        
        VStack{
            Text("Looks like your credentials were incorrect, or you haven't created an account.").navigationBarTitle("Oops!")
                .padding()
                .frame(width: 300, height: 110, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(40.0)
            
        }
    }
}


