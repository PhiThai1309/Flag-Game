//
//  ContentView.swift
//  flag
//
//  Created by Phi Thai on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var randomInt = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of: ")
                        .foregroundColor(.white)
                    Text(countries[randomInt])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) { number in
                    Button(){
                        flagTapped(number)
                    }label: {
                        Image(countries[number])
                            .shadow(radius: 50)
                    }
                }
            } .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is ???")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if(number == randomInt) {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        randomInt = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
