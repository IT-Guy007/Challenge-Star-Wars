//
//  ContentView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var content: ContentModel
    
    @State private var chosenResource: Resource = .People
    @State private var randomItem: Any = ""
    
    //Languages
    @AppStorage("Language") private var language = LocalizationService.shared.language

    var body: some View {
        if content.isShowingGroup {
            GroupView(resource: chosenResource)
                .environmentObject(content)
        } else if content.isShowingFavoritePage {
            FavoView()
                .environmentObject(content)
        } else {
            
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    //Nav bar
                    HStack {
                        Text("STAR")
                            .foregroundColor(Color("orange"))
                            .font(.system(size: 25))
                            .bold()
                        + Text("Info")
                            .foregroundColor(Color("orange"))
                            .font(.system(size: 25))
                            .bold()
                        Spacer()
                        Button {
                            content.isShowingFavoritePage = true
                        } label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("orange"))
                                .font(.system(size: 22))
                        }
                        Menu {
                            //English
                            Button {
                                LocalizationService.shared.language = .english_us
                            } label: {
                                Text("English")
                                
                            }
                            
                            //Dutch
                            Button {
                                LocalizationService.shared.language = .dutch
                            } label: {
                                Text("Dutch")
                                
                            }
                            
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                        }
                    }
                    
                    //Cards of types
                    ScrollView(.horizontal) {
                        HStack {
                            
                            //Droid
                            cardView(image: "starship", subtext: "Starships".localized(language), resource: .Starship)
                            
                            //person
                            cardView(image: "person", subtext: "Characters".localized(language), resource: .People)
                            
                            //Droid
                            cardView(image: "film", subtext: "Movie's".localized(language), resource: .Film)
                            
                            //Droid
                            cardView(image: "planet", subtext: "Planet's".localized(language), resource: .Planet)
                            
                            //Droid
                            cardView(image: "species", subtext: "Species".localized(language), resource: .Species)
                            
                            //Droid
                            cardView(image: "vehicle", subtext: "Vehicle's".localized(language), resource: .Vehicle)
                            
                            
                        }
                    }
                    
                    //The random item
                    itemCardView()
                    
                }
                
            }
            .padding()
            .padding(.top,30)
            .background {
                Image("background")
            }
            .task {
                content.retrieveAllContent()
            }
            //Delay in search, otherwise it would always give an empty view back
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                 self.randomItem = self.content.getRandomItem() ?? ""
                }
            }
        }
    }
    
    
    @ViewBuilder
    func cardView(image: String, subtext: String, resource: Resource) -> some View {
        Button {
            self.chosenResource = resource
            content.isShowingGroup = true
        } label: {
            Image(image)
                .resizable()
                .frame(width: 300, height: 400)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(40)
                .overlay {
                    VStack() {
                        Spacer()
                        HStack {
                            Text(subtext)
                                .foregroundColor(Color("orange"))
                                .font(.system(size: 25))
                                .bold()
                            Spacer()
                        }
                    }
                    .padding(15)
                }
        }
        .contextMenu {
            Button(action: {content.isShowingGroup = true}) {
                Text("Show \(subtext)")
            }
            if content.isShowingGroup {
                GroupView(resource: resource)
                    .environmentObject(content)
            }
        }
    }
    
    @ViewBuilder
    func itemCardView() -> some View {
        switch type(of: randomItem) {
        case is People.Type:
            let person = randomItem as! People
            
            Text("Item of the moment".localized(language))
                .foregroundColor(Color("orange"))
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                Text(person.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Height: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(person.height) cm")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text("Mass: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(person.mass) kg")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Birth year: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(person.birth_year)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Gender: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(person.gender)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(person.films.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        if let homeworld = content.getPlanetFromURL(string: person.homeworld ?? "")?.name ?? "" {
                            Text("HomeWorld: ".localized(language))
                                .font(.subheadline)
                                .foregroundColor(.white)
                            + Text(homeworld)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        } else {
                            Text("")
                        }
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 5,x: 0, y: 5)
        case is Starship.Type:
            let starship = randomItem as! Starship
            
            Text("Item of the moment".localized(language))
                .foregroundColor(Color("orange"))
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                Text(starship.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Length: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(starship.length)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Model: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(starship.model)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Class: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(starship.starship_class)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Costs: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(starship.cost_in_credits)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(starship.films.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 5,x: 0, y: 5)
        case is Film.Type:
            let film = randomItem as! Film
            
            Text("Item of the moment".localized(language))
                .foregroundColor(Color("orange"))
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                Text(film.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Director: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(film.director)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Producer: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(film.producer)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Release date: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(film.release_date)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Episode: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(film.episode_id)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Characters: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(film.characters.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("")
                        
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 5,x: 0, y: 5)
        case is Planet.Type:
            let planet = randomItem as! Planet
            
            Text("Item of the moment".localized(language))
                .foregroundColor(Color("orange"))
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                Text(planet.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Diameter: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(planet.diameter)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Population: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(planet.population)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Climate: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(planet.climate)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("ResidentsType: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(planet.residents.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(planet.films.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 5,x: 0, y: 5)
        case is Vehicle.Type:
            let vehicle = randomItem as! Vehicle
            
            Text("Item of the moment".localized(language))
                .foregroundColor(Color("orange"))
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                Text(vehicle.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Model: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(vehicle.model) cm")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Length: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(vehicle.length) kg")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Crew size: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(vehicle.crew)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Cost: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(vehicle.cost_in_credits)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: ".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text("\(vehicle.films.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 5,x: 0, y: 5)
        case is Species.Type:
            let species = randomItem as! Species
            Text("Item of the moment".localized(language))
            .foregroundColor(Color("orange"))
            .font(.title)
            .bold()
        
        VStack(alignment: .leading) {
            Text(species.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Language: ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    + Text("\(species.language) cm")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Designation: ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    + Text("\(species.designation) kg")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Height: ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    + Text(species.average_height)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Lifespan: ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    + Text(species.average_lifespan)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Films: ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    + Text("\(species.films.count)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    if let homeworld = content.getPlanetFromURL(string: species.homeworld ?? "")?.name ?? "" {
                        Text("HomeWorld: )")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        + Text(homeworld)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    } else {
                        Text("")
                    }
                }
            }
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 5,x: 0, y: 5)
        default:
            VStack {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
