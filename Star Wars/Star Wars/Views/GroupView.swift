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
    
    @State private var searchTextPeople: String = ""
    @State private var searchTextVehicle: String = ""
    @State private var searchTextStarship: String = ""
    @State private var searchTextSpecies: String = ""
    @State private var searchTextPlanets: String = ""
    @State private var searchTextFilm: String = ""
    
    var body: some View {
        
        NavigationView {
            switch resource {
            case .People:
                // Add views for People case
                List(searchResultsPeople, id: \.self) { person in
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
                    .environmentObject(content)
                }
                .searchable(text: $searchTextPeople)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
                
                
            case .Film:
                // Add views for Film case
                List(searchResultsFilms.sorted {$0.release_date < $1.release_date}, id: \.self) { film in
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
                    .environmentObject(content)
                    
                }
                .searchable(text: $searchTextFilm)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
                
            case .Starship:
                // Add views for Starship case
                List(searchResultsStarship, id: \.self) { starship in
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
                    .environmentObject(content)
                    
                }
                .searchable(text: $searchTextStarship)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
                
            case .Vehicle:
                // Add views for Vehicle case
                List(searchResultsVehicle, id: \.self) { vehicle in
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
                    .environmentObject(content)
                }
                .searchable(text: $searchTextVehicle)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
                
            case .Species:
                // Add views for Species case
                List(searchResultsSpecies, id: \.self) { specie in
                    
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
                    .environmentObject(content)
                }
                .searchable(text: $searchTextSpecies)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
                
            case .Planet:
                // Add views for Planet case
                List(searchResultsPlanets, id: \.self) { planet in
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
                    .environmentObject(content)
                }
                .searchable(text: $searchTextPlanets)
                .navigationBarTitle(Text(resource.rawValue.capitalized))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            content.isShowingGroup = false
                        } label: {
                            Image(systemName: "chevron.left")
                                .bold()
                            Text("Back")
                        }
                    }
                }
            }
            
        }
    }
    
    //MARK: - Search results
    var searchResultsPeople: [People] {
        if searchTextPeople.isEmpty {
            return content.allPeople
        } else {
            return content.allPeople.filter { $0.name.contains(searchTextPeople) }
        }
    }
    
    var searchResultsVehicle: [Vehicle] {
        if searchTextVehicle.isEmpty {
            return content.allVehicles
        } else {
            return content.allVehicles.filter { $0.name.contains(searchTextVehicle) }
        }
    }
    
    var searchResultsSpecies: [Species] {
        if searchTextSpecies.isEmpty {
            return content.allSpecies
        } else {
            return content.allSpecies.filter { $0.name.contains(searchTextSpecies) }
        }
    }
    
    var searchResultsStarship: [Starship] {
        if searchTextStarship.isEmpty {
            return content.allStarShips
        } else {
            return content.allStarShips.filter { $0.name.contains(searchTextStarship) }
        }
    }
    
    var searchResultsPlanets: [Planet] {
        if searchTextPlanets.isEmpty {
            return content.allPlanets
        } else {
            return content.allPlanets.filter { $0.name.contains(searchTextPlanets) }
        }
    }
    
    var searchResultsFilms: [Film] {
        if searchTextFilm.isEmpty {
            return content.allFilms
        } else {
            return content.allFilms.filter { $0.title.contains(searchTextFilm) }
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(resource: .People)
            .environmentObject(ContentModel())
    }
}
