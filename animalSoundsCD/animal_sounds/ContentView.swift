//
//  ContentView.swift
//  animal_sounds
//
//  Created by Seth Rodgers on 4/13/21.
//  TEAM 18
//

import SwiftUI
import CoreData




public var myUsername = ""
public var myPassword = ""

let persistenceController = PersistenceController.shared




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


//FETCH CORE DATA USER INSTANCE
//func fetchUser() -> [User]? {
//
//    let context = persistenceController.container.viewContext
//    let fetchRequest = NSFetchRequest<User>(entityName: "User")
//    //let details = try context.fetch(fetchRequest)
//
//    do {
//        let details = try context.fetch(fetchRequest)
//        return details
//    } catch let fetchError {
//        print("Failed to fetch companies: \(fetchError)")
//    }
//
//    return nil
//}







//PAGE ONE
struct pageOne: View{
    

    @State var userInput: String = ""
    @State var passInput: String = ""
    

    @State private var user = UserDefaults.standard.string(forKey: "Username")
    @State private var pass = UserDefaults.standard.string(forKey: "Password")
    
    
    var userArray: [String] = []
    var passArray: [String] = []
    
    var isLoggedin:Bool = false
    @State var GoToView2:Bool = false
    @State var accountCreated:Bool = false
    
    
    //FETCH CORE DATA
//    @FetchRequest(
//            sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
//            animation: .default)
//        private var items: FetchedResults<User>



    
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
            
//            List {
//                ForEach(items) { item in
//                    Text("Item is \(item.password!)")
//                    //userArray.append(item.password!)
//                }
//            }
  
            
            NavigationLink(destination: {
                VStack{
                    
                    
                    //VALIDATE LOGIN LOCALLY
                    if user == userInput && pass == passInput {
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
//                user = userInput
//                pass = passInput
                
                //VARIABLES FOR PROFILE PAGE
                myUsername = userInput
                myPassword = passInput
                
                
                
                print("User  \(String(describing: user))")
                print("Pass  \(String(describing: pass))")
                
                print("User input \(userInput)")
                print("Pass input \(passInput)")
                
                
                
                UserDefaults.standard.set(self.userInput, forKey: "Username")
                UserDefaults.standard.set(self.passInput, forKey: "Password")
                
                user = UserDefaults.standard.string(forKey: "Username")
                pass = UserDefaults.standard.string(forKey: "Password")
                
                accountCreated = true
                
                
                

                
                //CORE DATA CDOE
//                let context = persistenceController.container.viewContext
//                let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
//
//                newUser.username = myUsername
//                newUser.password = myPassword
//
//                newUser.setValue(myUsername, forKey: "username")
//                newUser.setValue(myPassword, forKey: "password")
//
//                do {
//                    try context.save()
//                    print("New user created")
//                    //return newUser
//                } catch let createError{
//                    print("Failed to create: \(createError)")
//                }
                
        
                
                
                
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
            Text("").navigationBarTitle("Home")
            
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


