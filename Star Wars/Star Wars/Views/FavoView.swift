//
//  FavoView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 17/01/2023.
//

import SwiftUI

struct FavoView: View {
    
    @EnvironmentObject private var content: ContentModel
    
    //Languages
    @AppStorage("Language") private var language = LocalizationService.shared.language
    
    var body: some View {
        if !(content.favoFilms.isEmpty && content.favoPeople.isEmpty && content.favoPlanets.isEmpty && content.favoVehicles.isEmpty && content.favoStarships.isEmpty && content.favoSpecies.isEmpty) {
            NavigationStack {
                
                Text("Favorite's")
                    .font(.title)
                //People
                Section {
                    List(content.favoPeople,id: \.self) { person in
                        NavigationLink(destination: PersonView(character: person)) {
                            Text(person.name)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                content.isShowingFavoritePage = false
                            } label: {
                                Image(systemName: "chevron.left")
                                    .bold()
                                Text("Back")
                            }
                        }
                    }
                } header: {
                    Text("Characters")
                }
                
                //Films
                Section {
                    List(content.favoFilms, id: \.self) { film in
                        NavigationLink(destination: FilmView(film: film)) {
                            Text(film.title)
                        }
                    }
                } header: {
                    Text("Films")
                }
                //Starships
                Section {
                    List(content.favoStarships,id: \.self) { starship in
                        NavigationLink(destination: StarshipView(starship: starship)) {
                            Text(starship.name)
                        }
                    }
                } header: {
                    Text("Starships")
                }
                //Vehicle's
                Section {
                    List(content.favoVehicles,id: \.self) { vehicle in
                        NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                            Text(vehicle.name)
                        }
                    }
                } header: {
                    Text("Vehicle's")
                }
                //Planet's
                Section {
                    List(content.favoPlanets,id: \.self) { planet in
                        NavigationLink(destination: PlanetView(planet: planet)) {
                            Text(planet.name)
                        }
                    }
                } header: {
                    Text("Planet's")
                }
                //Species
                Section {
                    List(content.favoSpecies,id: \.self) { specie in
                        NavigationLink(destination: SpeciesView(species: specie)) {
                            Text(specie.name)
                        }
                    }
                } header: {
                    Text("Specie's")
                }
            }
        } else {
            VStack {
                HStack {
                    Button {
                        content.isShowingFavoritePage = false
                    } label: {
                        Image(systemName: "chevron.left")
                            .bold()
                        Text("Back")
                    }
                    Spacer()
                }
                Spacer()
                Text("No favorite's found, go make some!")
                    
                Spacer()
            }
            .padding()
        }
        
    }
}

struct FavoView_Previews: PreviewProvider {
    static var previews: some View {
        FavoView()
            .environmentObject(ContentModel())
    }
}
