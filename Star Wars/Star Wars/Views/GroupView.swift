//
//  GroupView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct GroupView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var content: ContentModel
    
    @State var resource: Resource
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(resource.rawValue.capitalized)
                        .font(.system(size: 30))
                        .foregroundColor(Color("orange"))
                        .bold()
                    Spacer()
                    
                }
                .overlay {
                    HStack {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .bold()
                            Text("Back")
                                .foregroundColor(.white)
                                .bold()
                        }
                        Spacer()
                    }
                }
                Spacer()
                
                NavigationView {
                        switch resource {
                        case .People:
                            List(content.allPeople, id: \.self) { person in
                                NavigationLink(destination: PersonView(character: person)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(person.name)
                                            Text(person.homeworld ?? "")
                                        }
                                        Text("\(person.films.count) movies")
                                    }
                                }
                            }
                            .background {
                                Color("black")
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
                                        Text("\(film.characters.count) characters")
                                    }
                                }
                            }
                            .background {
                                Color("black")
                            }
                        case .Starship:
                            // Add views for Starship case
                            List(content.allStarShips, id: \.self) { starship in
                                NavigationLink(destination: StarshipView(starship: starship)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(starship.name)
                                            Text(starship.crew)
                                        }
                                        Text("\(starship.MGLT) MGLT")
                                    }
                                }
                            }
                            .background {
                                Color("black")
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
                                        Text("\(vehicle.cost_in_credits) credits")
                                    }
                                }
                            }
                            .background {
                                Color("black")
                            }
                        case .Species:
                            // Add views for Species case
                            List(content.allSpecies, id: \.self) { specie in
                                NavigationLink(destination: SpeciesView(species: specie)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(specie.name)
                                            Text(specie.homeworld ?? "")
                                        }
                                        Text(specie.language)
                                    }
                                }
                            }
                            .background {
                                Color("black")
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
                                        Text("\(planet.diameter) diameter")
                                    }
                                }
                            }
                            .background {
                                Color("black")
                            }
                        
                    }

                }
                
            }
            .padding()
            .padding(.top,35)
        }
        .background {
            Color("black")
        }
        .edgesIgnoringSafeArea(.all)
       
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(resource: .People)
            .environmentObject(ContentModel())
    }
}
