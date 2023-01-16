//
//  FilmView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct FilmView: View {
    @State var film: Film
    @EnvironmentObject private var content: ContentModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Ep: \(film.episode_id): \(film.title)")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Director: \(film.director)")
                            .font(.callout)
                        Text("Producer: \(film.producer)")
                            .font(.callout)
                        Text("Release date: \(film.release_date)")
                            .font(.callout)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    
                    VStack(alignment: .leading) {
                        Text("Characters:")
                            .font(.title2)
                        
                        ForEach(film.characters, id: \.self) { character in
                            Text(content.getPersonFromURL(string: character)?.name ?? "Unknown")
                        }
                        
                        Text("Vehicles:")
                            .font(.title2)
                        
                        ForEach(film.vehicles, id: \.self) { vehicle in
                            Text(content.getVehicleFromURL(string: vehicle).name)
                        }
                        
                        
                        Text("Planets:")
                            .font(.title2)
                        
                        ForEach(film.planets, id: \.self) { planet in
                            Text(content.getPlanetFromURL(string: planet)?.name ?? "Unknown")
                        }
                        
                        Text("Species:")
                            .font(.title2)
                        
                        ForEach(film.species, id: \.self) { planet in
                            Text(content.getSpeciesFromUrl(string: planet)?.name ?? "Unknown")
                        }
                        
                        
                        Spacer()
                    }
                }
                Text(film.opening_crawl)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                .padding()
                
                Spacer()
                HStack {Spacer()}
            }
            .padding()
            
        }
        .background(Color("black"))
        
    }
}
