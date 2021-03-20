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
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                })
            Text("Hello, world!")
                .padding().navigationBarTitle("Navigation", displayMode: .automatic)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
