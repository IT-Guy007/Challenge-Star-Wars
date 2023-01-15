//
//  FilmView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct FilmView: View {
    @State var film: Film
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        FilmView(film: .init(title: "First order", episode_id: 7, opening_crawl: "A long time ago", director: "Me", producer: " ", release_date: " ", characters: [], planets: [], starships: [], vehicles: [], species: [], created: " ", edited: " ", url: " "))
    }
}
