//
//  ContentView.swift
//  HeroWidget
//
//  Created by Ali serkan Boyracı  on 18.03.2023.
//

import SwiftUI
import WidgetKit

let superHeroArray = [superman, batman, ironman]

struct ContentView: View {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.aliserkanboyraci.HeroWidget."))
    var heroData : Data = Data()
    
    
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { hero in
                HeroView(hero: hero)
                    .onTapGesture {
                        saveToDefaults(hero: hero)
                    }
            }
        }
    }
    func saveToDefaults(hero: Superhero) {
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
