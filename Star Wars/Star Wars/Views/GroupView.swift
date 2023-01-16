//
//  GroupView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct GroupView: View {
    
    @EnvironmentObject private var content: ContentModel
    
    @State var resource: Resource
    
    var body: some View {
        
        NavigationView {
            switch resource {
            case .People:
                List(content.allPeople, id: \.self) { person in
                    let homeworld = content.getPlanetFromURL(string: person.homeworld ?? "")?.name ?? ""
                    NavigationLink(destination: PersonView(character: person)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(person.name)
                                if !homeworld.isEmpty {
                                    Text(homeworld)
                                }
                            }
                            Spacer()
                            if(person.films.count != 1) {
                                Text("\(person.films.count) movies")
                            } else {
                                Text("\(person.films.count) movie")
                            }
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
                
                // Add views for People case
            case .Film:
                // Add views for Film case
                List(content.allFilms.sorted {$0.release_date < $1.release_date}, id: \.self) { film in
                    NavigationLink(destination: FilmView(film: film)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(film.title)
                                Text(film.release_date)
                                
                            }
                            Spacer()
                            Text("\(film.characters.count) characters")
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
                
            case .Starship:
                // Add views for Starship case
                List(content.allStarShips, id: \.self) { starship in
                    NavigationLink(destination: StarshipView(starship: starship)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(starship.name)
                                Text("Crew: \(starship.crew)")
                            }
                            Spacer()
                            Text("\(starship.MGLT) MGLT")
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
                
            case .Vehicle:
                // Add views for Vehicle case
                List(content.allVehicles, id: \.self) { vehicle in
                    NavigationLink(destination: VehicleView(vehicle: vehicle)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(vehicle.name)
                                Text(vehicle.crew)
                            }
                            Spacer()
                            Text("\(vehicle.cost_in_credits) credits")
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
                
            case .Species:
                // Add views for Species case
                List(content.allSpecies, id: \.self) { specie in
                    
                    NavigationLink(destination: SpeciesView(species: specie)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(specie.name)
                                Text(specie.language)
                                
                            }
                            Spacer()
                            Text(specie.designation)
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
                
            case .Planet:
                // Add views for Planet case
                List(content.allPlanets, id: \.self) { planet in
                    NavigationLink(destination: PlanetView(planet: planet)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(planet.name)
                                Text("\(planet.population) citizens")
                            }
                            Spacer()
                            Text("\(planet.diameter) diameter")
                        }
                    }
                }
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
            
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(resource: .People)
            .environmentObject(ContentModel())
    }
}
