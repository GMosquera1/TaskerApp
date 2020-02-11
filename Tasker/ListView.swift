//
//  ListView.swift
//  Tasker
//
//  Created by Genesis Mosquera on 2/7/20.
//  Copyright © 2020 Genesis Mosquera. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State var affirmations = [ Affirmation(quote: "Such a good app. Social media as an engine of positivity", image: "JevonG"), (quote: "It's going to be better than I could dream of", image: "image2")]
    
    var body: some View {
        List {
            ForEach(affirmations) { affirmation in BasicImageRow(affirmation: affirmation)
                .contextMenu {
                    Button(action: {
                        self.delete(item: affirmation)
                    }) {
                        HStack {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                    }
                    Button(action: {
                        self.setFavorite(item: affirmation)
                    }) {
                        HStack {
                            Text("Favorite")
                            Image(systemName: "star")
                        }
                    }
                }
            }
            .onDelete { (indexSet) in
                self.affirmations.remove(atOffsets: indexSet)
            }
        }
    }
    
    private func delete(item affirmation: Affirmation) {
        if let index = self.affirmations.firstIndex(where: { $0.id == affirmation.id}) {
            self.affirmations.remove(at: index)
        }
    }
    
    private func setFavorite(item affirmation: Affirmation) {
        if let index = self.affirmations.firstIndex(where: {$0.id == affirmation.id}) {
            self.affirmations[index].isFavorite.toggle()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct Affirmation: Identifiable {
    var id = UUID()
    var quote: String
    var image: String
    var isFavorite: Bool = false
}

struct BasicImageRow: View {
    var affirmation: Affirmations
    
    var body: some View {
        HStack {
            Image(affirmation.image)
            resizable()
            frame(width: 40, height: 40)
            cornerRadius(5)
            Text(affirmation.name)
            
            if affirmation.isFavorite {
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
