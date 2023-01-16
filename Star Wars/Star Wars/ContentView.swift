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
    @State private var cardPosition: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 0)

    var body: some View {
        if content.isShowingGroup {
            GroupView(resource: chosenResource)
                .environmentObject(content)
                .animation(.easeIn, value: content.isShowingGroup)
            
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
                            cardView(image: "starship", subtext: "Starships", resource: .Starship)
                            
                            //person
                            cardView(image: "person", subtext: "Characters", resource: .People)
                            
                            //Droid
                            cardView(image: "film", subtext: "Movie's", resource: .Film)
                            
                            //Droid
                            cardView(image: "planet", subtext: "Planet's", resource: .Planet)
                            
                            //Droid
                            cardView(image: "species", subtext: "Species", resource: .Species)
                            
                            //Droid
                            cardView(image: "vehicle", subtext: "Vehicle's", resource: .Vehicle)
                            
                            
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
                    withAnimation(.spring(response: 0.5,dampingFraction: 0.5,blendDuration: 0.5)) {
                        self.randomItem = self.content.getRandomItem() ?? ""
                        self.cardPosition = .zero
                    }
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
            
            Text("Item of the moment")
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
                        
                        Text("Height: \(person.height) cm")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Mass: \(person.mass) kg")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Birth year: \(person.birth_year)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Gender: \(person.gender)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: \(person.films.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        if let homeworld = content.getPlanetFromURL(string: person.homeworld ?? "")?.name ?? "" {
                            Text("HomeWorld: \(homeworld)")
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
            
            Text("Item of the moment")
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
                        
                        Text("Length: \(starship.length)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Model: \(starship.model)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Class: \(starship.starship_class)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Costs: \(starship.cost_in_credits)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: \(starship.films.count)")
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
            
            Text("Item of the moment")
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
                        
                        Text("Director: \(film.director)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Producer: \(film.producer)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Release date: \(film.release_date)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Episode: \(film.episode_id)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Characters: \(film.characters.count)")
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
            
            Text("Item of the moment")
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
                        
                        Text("Diameter: \(planet.diameter)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Population: \(planet.population)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Climate: \(planet.climate)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("ResidentsType: \(planet.residents.count)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: \(planet.films.count)")
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
            
            Text("Item of the moment")
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
                        
                        Text("Model: \(vehicle.model) cm")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Length: \(vehicle.length) kg")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Crew size: \(vehicle.crew)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Cost: \(vehicle.cost_in_credits)")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text("Films: \(vehicle.films.count)")
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
        Text("Item of the moment")
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
                    
                    Text("Language: \(species.language) cm")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Designation: \(species.designation) kg")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Height: \(species.average_height)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Lifespan: \(species.average_lifespan)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Films: \(species.films.count)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    if let homeworld = content.getPlanetFromURL(string: species.homeworld ?? "")?.name ?? "" {
                        Text("HomeWorld: \(homeworld)")
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
