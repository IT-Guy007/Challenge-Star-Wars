//
//  PlanetView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct PlanetView: View {
    @State var planet: Planet
    @EnvironmentObject private var content: ContentModel
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Spacer()
                Button {
                    if content.favoPlanets.contains(planet) {
                        content.favoPlanets.removeAll(where: {$0 == planet})
                    } else {
                        content.favoPlanets.append(planet)
                    }
                } label: {
                    if content.favoPlanets.contains(planet) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("orange"))
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color("orange"))
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(planet.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Population: \(planet.population)")
                            .font(.callout)
                        Text("Diameter: \(planet.diameter)")
                            .font(.callout)
                        Text("Climate: \(planet.climate)")
                            .font(.callout)
                        Text("Terrain: \(planet.terrain)")
                            .font(.callout)
                        
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Gravity: \(planet.gravity)")
                            .font(.callout)
                        Text("Orbital period: \(planet.orbital_period)")
                            .font(.callout)
                        Text("Rotation period: \(planet.rotation_period)")
                            .font(.callout)
                        Text("Surface water: \(planet.surface_water)")
                            .font(.callout)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Films:")
                            .font(.title2)
                        
                        ForEach(planet.films, id: \.self) { film in
                            Text(content.getFilmFromURL(string: film)?.title ?? "")
                        }
                        
                        

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("People:")
                            .font(.title2)
                        
                        ForEach(planet.residents, id: \.self) { resident in
                            Text(content.getPersonFromURL(string: resident)?.name ?? "Unknown")
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
