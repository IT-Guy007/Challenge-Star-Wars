//
//  PersonView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct PersonView: View {
    @State var character: People
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(character: .init(name: "Test", height: "19cm", mass: "Mass", hair_color: "Blue", skin_color: "Yellow", eye_color: "Green", birth_year: "2038-02-08", gender: "Male", homeworld: "Earth", films: [], species: [], vehicles: [], starships: [], created: "Today", edited: "", url: ""))
    }
}
