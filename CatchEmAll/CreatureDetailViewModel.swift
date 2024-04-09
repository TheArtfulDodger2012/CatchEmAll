//
//  CreaturesDetailViewModel.swift
//  CatchEmAll
//
//  Created by Ron Lane on 4/7/24.
//

import Foundation

@MainActor
class CreatureDetailViewModel: ObservableObject {
    
private struct Returned: Codable {
    var count: Int
    var next: String
    var results: [Creature]
}

@Published var urlString = "https://pokeapi.co/api/v2/pokemon"
@Published var count = 0
@Published var creaturesArray: [Creature] = []

func getData() async {
    guard let url = URL(string: urlString) else { return }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else { return }
        self.count = returned.count
        self.urlString = returned.next
        self.creaturesArray = returned.results
    } catch {
        print("Could not get data from \(urlString)")
    }
}
