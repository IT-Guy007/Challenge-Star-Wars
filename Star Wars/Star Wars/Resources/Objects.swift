//
//  Objects.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import Foundation


struct People: Decodable, Hashable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String?
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

struct PeopleWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [People]
}

struct Film: Decodable, Hashable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

struct FilmWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]
}

struct Starship: Decodable, Hashable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String
    let consumables: String
    let hyperdrive_rating: String
    let MGLT: String
    let starship_class: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct StarShipWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

struct Vehicle: Decodable, Hashable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String
    let consumables: String
    let vehicle_class: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct VehicleWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}

struct Species: Decodable, Hashable {
    let name: String
    let classification: String
    let designation: String
    let average_height: String
    let skin_colors: String
    let hair_colors: String
    let eye_colors: String
    let average_lifespan: String
    let homeworld: String?
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct SpeciesWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Species]
}

struct Planet: Decodable, Hashable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct PlanetWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}
