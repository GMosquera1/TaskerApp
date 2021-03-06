//
//  CircleImage.swift
//  Tasker
//
//  Created by Genesis Mosquera on 1/13/20.
//  Copyright © 2020 Genesis Mosquera. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("images-2")
            .clipShape(Circle()).overlay(Circle().stroke(Color.blue, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
