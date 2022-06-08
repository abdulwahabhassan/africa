//
//  ContentView.swift
//  Africa
//


import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    @State private var  gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    @State private var gridColumn: Int = 1
    
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 ))
                        
                        ForEach(animals) { item in
                            NavigationLink(destination: AnimalDetailView(animal: item), label: {AnimalListItemView(animal: item)})
                        } //: LOOP
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: NAVLINK
                            } //: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    } //: SCROLLVIEW
                }//: CONDITION
            } //GROUP
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            
                            haptics.impactOccurred()
                            if (isGridViewActive) {
                                if(gridColumn < 3) {
                                    gridColumn += 1
                                } else {
                                    gridColumn = 1
                                }
                            }
                            gridLayout = Array(repeating: GridItem(.flexible()), count: gridColumn)
                            isGridViewActive = true
                        }) {
                            if (gridColumn == 1) {
                                Image(systemName: "rectangle.grid.1x2" )
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                                    .frame(width: 32, height: 32)
                            } else {
                                Image(systemName: "square.grid.\(gridColumn)x\(gridColumn)" )
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                                    .frame(width: 32, height: 32)
                            }
                        }
                    }
                }
            })
        } //: NAVIGATION
        .padding(.horizontal, -10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
