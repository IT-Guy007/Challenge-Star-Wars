//
//  PlanetView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct PlanetView: View {
    @State var planet: Planet
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: .init(name: "Earth", rotation_period: "24.01H", orbital_period: "365.25", diameter: "4926KM", climate: "Cold", gravity: "8.91", terrain: "Flat", surface_water: "Windy", population: "7Bil", residents: [], films: [], created: "A long time ago", edited: "", url: ""))
    }
}
