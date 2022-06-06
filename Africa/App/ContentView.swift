//
//  ContentView.swift
//  Africa
//


import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationView {
            VStack {
                List {
                    CoverImageView()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
                    
                    ForEach(animals) { item in
                        NavigationLink(destination: AnimalDetailView(animal: item), label: {AnimalListItemView(animal: item)})
                    }
                } //: LIST
                .navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
            }
        } //: NAVIGATION
        .padding(.horizontal, -10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
