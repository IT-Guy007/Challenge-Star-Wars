//
//  StarshipView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct StarshipView: View {
    @State var starship: Starship
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView(starship: .init(name: "Falcon", model: "None", manufacturer: "Unknown", cost_in_credits: "One game", length: "90M", max_atmosphering_speed: "Lightspeed", crew: "Rebels", passengers: "None", cargo_capacity: "A lot", consumables: "None", hyperdrive_rating: "8.2", MGLT: "80 MGLT", starship_class: "Custom", pilots: [], films: [], created: "", edited: "", url: ""))
    }
}
