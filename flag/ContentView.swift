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
    @State private var userScore = 0
    @State private var userChoice = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var randomInt = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack(spacing: 30){
                Spacer()
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
                        userChoice = countries[number]
                    }label: {
                        Image(countries[number])
                            .shadow(radius: 50)
                    }
                }
                Spacer()
                Text("Your score is: \(userScore)")
                    .font(.title.weight(.semibold))
                    .foregroundColor(.white)
            } .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                if(userScore < 0) {
                    Text("You loose!")
                } else {
                    Text("""
                    That's the flag of: \(userChoice)
                    Your score is: \(userScore)
                    """)
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if(number == randomInt) {
            scoreTitle = "Correct"
            userScore += 2
        } else {
            scoreTitle = "Wrong"
            userScore -= 2
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
