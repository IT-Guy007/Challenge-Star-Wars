//
//  LaunchView.swift
//  Star Wars
//
//  Created by Jeroen den Otter on 15/01/2023.
//

import SwiftUI

struct LaunchView: View {
    
    @ObservedObject var content: ContentModel = ContentModel()
    
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                VStack {
                    Spacer()
                    Text("Images have copyright")
                        .foregroundColor(.white)
                        .font(.footnote)
                }
                .background {
                    Image("droid-left")
                }
                .padding()
            } else {
                ContentView()
                    .environmentObject(content)
            }
        }
        .onAppear {
            //Get the content
            DispatchQueue.main.async {
                content.retrieveAllContent()
            }
            //Delay for view
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isLoading = false
                }
            }
            

        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
