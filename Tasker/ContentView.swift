//
//  ContentView.swift
//  Tasker
//
//  Created by Genesis Mosquera on 1/13/20.
//  Copyright © 2020 Genesis Mosquera. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            //Map
            MapView()
                .frame(height:300)
                .edgesIgnoringSafeArea(.top)
            
            //Image
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            //TextViews
            VStack(alignment: .leading) {
                Text("DECLARATION")
                    .font(.title)
                HStack {
                    Text("CROSSOVER 2020!")
                        .font(.subheadline)
                    Spacer()
                    Text("EPHESIANS 3:20")
                }
            }.padding()
            
            // Spacer
            Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
