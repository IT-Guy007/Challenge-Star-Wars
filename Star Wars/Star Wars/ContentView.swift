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

    var body: some View {
        if content.isShowingGroup {
            GroupView(resource: chosenResource)
                .environmentObject(content)

        } else {
            ScrollView(.vertical) {
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
                
                //Types
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
                Spacer()
            }
            .padding()
            .background {
                Image("background")
            }
            .padding(.top, 10)
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
                    .padding(20)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
