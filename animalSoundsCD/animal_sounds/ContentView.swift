//
//  ContentView.swift
//  animal_sounds
//
//  Created by Seth Rodgers on 4/13/21.
//  TEAM 18
//

import SwiftUI
import CoreData
import AVKit




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
                    
                    if user == userInput && pass == passInput || user == userInput && passInput == UserDefaults.standard.string(forKey: "Password")! {
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
                print("Current pass: \(UserDefaults.standard.string(forKey: "Password"))")
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
//struct pageThree: View{
//    var body: some View{
//
//        VStack{
//            Text("Classification Page").navigationBarTitle("Classification Page")
//
//        }
//    }
//}




//PAGE THREE - CLASSIFICATION PAGE
struct pageThree: View{
    @State var session: AVAudioSession!
    @State var AudioRecorder: AVAudioRecorder!
    @State var AudioPlayer : AVAudioPlayer!

    @State var SoundFileName2: String = "ExampleSoundFileName.mp3"  //string should hold the sound file
    @State private var isRecording = false //when button clicked changes start recording to stop recordin
    @State var numberOfRecordings: Int = 0
    @State var Recordings : [URL] = []

    var body: some View{


        NavigationView{
        VStack{

            Text("AnimalSoundRecording\(numberOfRecordings).m4a")
                .frame(width:350,height:20)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))//gives the gray color
                .font(.system(size:22,design:.default))
                .cornerRadius(8.0)
                .padding()
            Button {

                if AudioRecorder == nil //checks if there current audio recordings happening
                {
                    numberOfRecordings += 1
                    //increment the numberOfRecordings
                    let SoundFileName = getDirectory().appendingPathComponent("AnimalSoundRecording\(numberOfRecordings).m4a")
                    let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),AVSampleRateKey : 12000, AVNumberOfChannelsKey : 1 , AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue ]

                    do{
                        //Sound Recording will start
                        AudioRecorder = try AVAudioRecorder(url: SoundFileName, settings: settings)
                        AudioRecorder.record()
                        isRecording.toggle()
                    }catch{
                        print(error.localizedDescription)

                    }

                }
                else{
                    //Sound Recording will stop and be set to nil
                    AudioRecorder.stop()
                    AudioRecorder = nil
                    isRecording.toggle()

                }
                //isRecording.toggle()
                }label:{


                    ClassificationButtonView(title: isRecording ? "Stop Recording": "Start Recording" , imageName: isRecording ? "stop.fill": "play.fill", backgroundColor: isRecording ? Color(.red): Color(.green),textColor: Color(.black))



                }

            Button{
                    playAudio()
                    //plays audio back
                }label:{
                    ClassificationButtonView(title: "Play Audio Back", imageName: "play.circle", backgroundColor: Color(.blue), textColor: Color(.white))

                }

            Button{
                //perform the classification
                }label:{
                    ClassificationButtonView(title: "Perform Classification", imageName: " ",backgroundColor: Color(.gray), textColor: Color(.black))
                }
            }
        }
        .navigationBarTitle("Classification Page")
        .onAppear{

            session = AVAudioSession.sharedInstance()
            session.requestRecordPermission{(  permission  )in
                if permission{
                    print("Accepted")
                }

            }

        }

    }
    /* This functions allows the system to store the audio recordings and retrieve the path where they are stored*/
    func getDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask )
        let documentDirectory   = paths[0]
        return documentDirectory
    }
    func playAudio()
    {
        let path = getDirectory().appendingPathComponent("AnimalSoundRecording\(numberOfRecordings).m4a")
        do{
            AudioPlayer = try AVAudioPlayer(contentsOf: path)
            AudioPlayer.play()

        }catch{

            print(error.localizedDescription)
        }
    }

}



//PAGE FOUR - PROFILE PAGE
struct pageFour: View{
    
    @State var newU = UserDefaults.standard.string(forKey: "Username")!
    @State var newP = UserDefaults.standard.string(forKey: "Password")!
    @State var passChangeInput: String = ""
    
    var body: some View{
        
        
        
        
        VStack{
            Image("swift-image")
                .resizable()
                .frame(width: 110, height:110)
                .clipShape(Circle()) // Clip the image to a circle
                .position(x: 192, y: 170)
            
            Text("User Profile").navigationBarTitle("Profile Page")
                .frame(width: 200, height: 100, alignment: .top)
                .position(x: 190.0, y: 150.0).foregroundColor(.blue)
                .font(.largeTitle)
            
            Text("Username: \(newU)")
                //.padding()
                .frame(width: 300, height: 70, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(40.0)
                .position(x: 192.0, y: 60.0).foregroundColor(.white)
            Text("Password: \(newP)")
                //.padding()
                .frame(width: 300, height: 70, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(40.0)
                .position(x: 192.0, y: 0.0).foregroundColor(.white)
            
            
            
            TextField("New Passord", text: $passChangeInput)
                .padding()
                .background(Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255))
                .cornerRadius(8.0)
                .padding()
            
            Button(action: {
      
                newP = passChangeInput
                UserDefaults.standard.set(self.passChangeInput, forKey: "Password")
                
                
                
            }) {
                Text("Change Password")
                
            }.padding()

        }
    }
}



//PAGE FIVE - MODEL INFO
struct pageFive: View{
    var body: some View{
        
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Text("ML Model")
                .frame(width: 200, height: 100, alignment: .top)
                .position(x: 132.0, y: 180.0).foregroundColor(.white)
                .font(.largeTitle)
            Text("In order for the Machine Learning Algorithm to be able to use sounds and sound files, we needed to implement sound capturing into our application.  We used Apple's developer documentation and found a Sound Analisys Article describing how the application can capture sound from user input through the microphone, or how the user can upload a sound file. We used the baseline given on the artice to implement it to our application giving us our fully functional classification module for the user to utilize.").navigationBarTitle("Model Info")
                .padding()
                .frame(width: 300, height: 410, alignment: .center)
                //.background(Color.blue)
                .foregroundColor(Color.white)
                //.cornerRadius(40.0)
            //Color.blue
            
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







//Classification Buttons
struct ClassificationButtonView: View{
    var title: String
    var imageName: String
    var backgroundColor: Color
    var textColor: Color
    var body: some View{
        ZStack(alignment:.trailing){
            Text(title)
                .frame(width:280,height:50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size:20,weight:.bold ,design: .default))
                .cornerRadius(10)
            
                
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()//makes it large
                .aspectRatio(contentMode: .fit)//makes it clear image
                .frame(width: 25,height: 25)
                .padding()
            
                }
    }
}
