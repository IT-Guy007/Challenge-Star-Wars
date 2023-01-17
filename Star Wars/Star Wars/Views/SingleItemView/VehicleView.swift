//
//  VehicleView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct VehicleView: View {
    @State var vehicle: Vehicle
    @EnvironmentObject private var content: ContentModel
    
    var body: some View {
        ScrollView(.vertical) {
            HStack {
                Spacer()
                Button {
                    if content.favoVehicles.contains(vehicle) {
                        content.favoVehicles.removeAll(where: {$0 == vehicle})
                    } else {
                        content.favoVehicles.append(vehicle)
                    }
                } label: {
                    if content.favoVehicles.contains(vehicle) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("orange"))
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(Color("orange"))
                    }
                }
            }
            VStack(alignment: .leading) {
                Text(vehicle.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("orange"))
                HStack {
                    VStack(alignment: .leading) {
                        Text("Crew size: \(vehicle.crew)")
                            .font(.callout)
                        Text("Class: \(vehicle.vehicle_class)")
                            .font(.callout)
                        Text("Model: \(vehicle.model)")
                            .font(.callout)
                        Text("Cost: \(vehicle.cost_in_credits)")
                            .font(.callout)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Length: \(vehicle.length)")
                            .font(.callout)
                        Text("Cargo capacity: \(vehicle.cargo_capacity)")
                            .font(.callout)
                        Text("Passengers: \(vehicle.passengers)")
                            .font(.callout)
                        Text("Atmosphering speed+: \(vehicle.max_atmosphering_speed)")
                            .font(.callout)
                    }
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Films:")
                            .font(.title2)
                        
                        ForEach(vehicle.films, id: \.self) { film in
                            Text(content.getFilmFromURL(string: film)?.title ?? "")
                        }

                    }
                    .frame(width: UIScreen.main.bounds.width * 0.4)
                    
                    VStack {
                        Text("Pilots:")
                            .font(.title2)
                        
                        ForEach(vehicle.pilots, id: \.self) { pilot in
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
