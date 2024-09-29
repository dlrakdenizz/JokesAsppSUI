//
//  ContentView.swift
//  JokesAppSUI
//
//  Created by Dilara Akdeniz on 26.07.2023.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        
        NavigationView {
            
            List(jokesVM.jokes) { element in
                
                Text(element.joke)
                
            }
            .toolbar{
                Button(action: addJoke) {
                    Text("Get New Joke")
                }
            }
            .navigationBarTitle(Text("Jokes App"))
        }
    }
    
    func addJoke() {
        jokesVM.addJokes()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
