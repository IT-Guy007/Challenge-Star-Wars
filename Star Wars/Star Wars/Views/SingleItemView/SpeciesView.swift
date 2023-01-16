//
//  SpeciesView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct SpeciesView: View {
    @EnvironmentObject private var content: ContentModel
    @State var species: Species
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(species.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Lifespan: \(species.average_lifespan)")
                            .font(.callout)
                        Text("Height: \(species.average_height)")
                            .font(.callout)
                        Text("Language: \(species.language)")
                            .font(.callout)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Designation: \(species.designation)")
                            .font(.callout)
                        Text("Classification: \(species.classification)")
                            .font(.callout)
                        if let homeworld = content.getPlanetFromURL(string: species.homeworld ?? "") {
                            Text(homeworld.name)
                                .font(.callout)
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Films:")
                            .font(.title2)
                        
                        ForEach(species.films, id: \.self) { film in
                            Text(content.getFilmFromURL(string: film).title)
                        }
                        
                        

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("People:")
                            .font(.title2)
                        
                        ForEach(species.people, id: \.self) { person in
                            Text(content.getPersonFromURL(string: person)?.name ?? "Unknown")
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
