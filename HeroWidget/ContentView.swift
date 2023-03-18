//
//  ContentView.swift
//  HeroWidget
//
//  Created by Ali serkan Boyracı  on 18.03.2023.
//

import SwiftUI

let superHeroArray = [superman, batman, ironman]

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(superHeroArray) { hero in
                HeroView(hero: hero)
                    .onTapGesture {
                        saveToDefaults(hero: hero)
                    }
            }
        }
        .padding()
    }
    func saveToDefaults(hero: Superhero) {
        print(hero.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
