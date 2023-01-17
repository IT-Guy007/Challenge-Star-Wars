//
//  StarshipView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct StarshipView: View {
    @State var starship: Starship
    @EnvironmentObject private var content: ContentModel
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Spacer()
                Button {
                    if content.favoStarships.contains(starship) {
                        content.favoStarships.removeAll(where: {$0 == starship})
                    } else {
                        content.favoStarships.append(starship)
                    }
                } label: {
                    if content.favoStarships.contains(starship) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("orange"))
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color("orange"))
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(starship.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Crew size: \(starship.crew)")
                            .font(.callout)
                        Text("Class: \(starship.starship_class)")
                            .font(.callout)
                        Text("Model: \(starship.model)")
                            .font(.callout)
                        Text("Cost: \(starship.cost_in_credits)")
                            .font(.callout)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Length: \(starship.length)")
                            .font(.callout)
                        Text("Cargo capacity: \(starship.cargo_capacity)")
                            .font(.callout)
                        Text("MGLT: \(starship.MGLT)")
                            .font(.callout)
                        Text("Hyperdrive rating+: \(starship.hyperdrive_rating)")
                            .font(.callout)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Films:")
                            .font(.title2)
                        
                        ForEach(starship.films, id: \.self) { film in
                            Text(content.getFilmFromURL(string: film)?.title ?? "")
                        }

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Pilots:")
                            .font(.title2)
                        
                        ForEach(starship.pilots, id: \.self) { pilot in
                            Text(content.getPersonFromURL(string: pilot)?.name ?? "Unknown")
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
