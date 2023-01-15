//
//  SpeciesView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct SpeciesView: View {
    @State var species: Species
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SpeciesView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView(species: .init(name: "Human", classification: "Primative", designation: " ", average_height: "165", skin_colors: "Varies", hair_colors: "Varies", eye_colors: "Varies", average_lifespan: "80", homeworld: "Earth", language: "Multiple", people: [], films: [], created: " ", edited: " ", url: " "))
    }
}
