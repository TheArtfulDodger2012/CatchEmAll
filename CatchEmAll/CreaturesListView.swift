//
//  ContentView.swift
//  CatchEmAll
//
//  Created by Ron Lane on 4/7/24.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = ["Pikachu", "Squirtle", "Charzard", "Snorlax"]
    
    var body: some View {
        NavigationStack {
            List(creatures, id: \.self) { creature in
                Text(creature)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
        .padding()
    }
}

#Preview {
    CreaturesListView()
}
