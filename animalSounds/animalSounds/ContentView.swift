//
//  ContentView.swift
//  animalSounds
//
//  Created by Seth Rodgers on 3/19/21.
//

import SwiftUI





struct ContentView: View {
    var body: some View {
    
        NavigationView{
            
            pageOne().navigationBarTitle("Page One", displayMode: .inline)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct pageOne: View{
    var body: some View{
        
        VStack{
            Text("Page one").navigationBarTitle("Page one")
            NavigationLink(destination: pageTwo()){
                Text("Go to page two")
            }

        }
    }
}


struct pageTwo: View{
    var body: some View{
        
        VStack{
            Text("Page two").navigationBarTitle("Page two")
            NavigationLink(destination: pageThree()){
                Text("Go to page three")
            }
        }
    }
}


struct pageThree: View{
    var body: some View{
        
        VStack{
            Text("Page three").navigationBarTitle("Page three")

        }
    }
}
