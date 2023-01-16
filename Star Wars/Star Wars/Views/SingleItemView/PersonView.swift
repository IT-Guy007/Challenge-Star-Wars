//
//  PersonView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject private var content: ContentModel
    @State var character: People
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gender: \(character.gender)")
                            .font(.callout)
                        Text("birth year: \(character.birth_year)")
                            .font(.callout)
                        Text("Height: \(character.height)")
                            .font(.callout)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Hair color: \(character.hair_color)")
                            .font(.callout)
                        Text("Eye color: \(character.eye_color)")
                            .font(.callout)
                        Text("Skin color: \(character.skin_color)")
                            .font(.callout)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Films:")
                            .font(.title2)
                        
                        ForEach(character.films, id: \.self) { film in
                            Text(content.getFilmFromURL(string: film).title)
                        }
                        
                        Text("Vehicles:")
                            .font(.title2)
                        
                        ForEach(character.vehicles, id: \.self) { vehicle in
                            Text(content.getVehicleFromURL(string: vehicle).name)
                        }

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Starships:")
                            .font(.title2)
                        
                        ForEach(character.starships, id: \.self) { starship in
                            Text(content.getStarShipFromURL(string: starship).name)
                        }
                        
                        Text("Species:")
                            .font(.title2)
                        
                        ForEach(character.species, id: \.self) { planet in
                            Text(content.getSpeciesFromUrl(string: planet)?.name ?? "Unknown")
                        }
                    }
                }
                
                Spacer()
                HStack {Spacer()}
            }
            .padding()
            
        }
        .background(Color("black"))
    }
}
