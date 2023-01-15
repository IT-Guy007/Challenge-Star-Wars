//
//  ContentModel.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    //Objects that hold all the resources
    @Published var allPeople: [People] = []
    @Published var allFilms: [Film] = []
    @Published var allStarShips: [Starship] = []
    @Published var allVehicles: [Vehicle] = []
    @Published var allSpecies: [Species] = []
    @Published var allPlanets: [Planet] = []
    
    @Published var isShowingGroup: Bool = false
    
    func retrieveAllContent() {
        //Get's all the resources
        retrieveResource(resource: .People)
        retrieveResource(resource: .Film)
        retrieveResource(resource: .Starship)
        retrieveResource(resource: .Vehicle)
        retrieveResource(resource: .Species)
        retrieveResource(resource: .Planet)
    }
    
    func retrieveResource(resource: Resource) {
        guard let url = URL(string: "https://swapi.dev/api/\(resource.rawValue)/?format=json") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    switch resource {
                    case .People:
                        let peopleWrapper = try JSONDecoder().decode(PeopleWrapper.self, from: data)
                        self.allPeople = peopleWrapper.results
                    case .Film:
                        let filmWrapper = try JSONDecoder().decode(FilmWrapper.self, from: data)
                        self.allFilms = filmWrapper.results
                    case .Starship:
                         let starshipWrapper = try JSONDecoder().decode(StarShipWrapper.self, from: data)
                        self.allStarShips = starshipWrapper.results
                    case .Vehicle:
                         let vehicleWrapper = try JSONDecoder().decode(VehicleWrapper.self, from: data)
                        self.allVehicles = vehicleWrapper.results
                    case .Species:
                         let speciesWrapper = try JSONDecoder().decode(SpeciesWrapper.self, from: data)
                        self.allSpecies = speciesWrapper.results
                    case .Planet:
                        let planetWrapper = try JSONDecoder().decode(PlanetWrapper.self, from: data)
                        self.allPlanets = planetWrapper.results
                    }
                    
                } catch let jsonError {
                    print(jsonError)
                    return
                }
            }
        }
        //Start getting the resources
        task.resume()
    }

}

//Resource types
enum Resource: String {
    case People = "people",
    Film = "films",
    Starship = "starships",
    Vehicle = "vehicles",
    Species = "species",
    Planet = "planets"
}
