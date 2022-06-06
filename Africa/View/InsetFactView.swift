//
//  InsetFactView.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 06/06/2022.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: Animal
    
    var body: some View {
        Group  {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GROUPBOX
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        
        InsetFactView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
