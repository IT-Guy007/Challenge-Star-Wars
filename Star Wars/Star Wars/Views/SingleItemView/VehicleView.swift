//
//  VehicleView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct VehicleView: View {
    @State var vehicle: Vehicle
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView(vehicle: .init(name: "Test model", model: "Custom", manufacturer: "First order", cost_in_credits: "80", length: "80", max_atmosphering_speed: "8.3 Lightspeed", crew: " ", passengers: " ", cargo_capacity: " ", consumables: " ", vehicle_class: " ", pilots: [], films: [], created: " ", edited: " ", url: " "))
    }
}
