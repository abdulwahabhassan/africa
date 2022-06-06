//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 06/06/2022.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal: Animal
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            } //HSTACK
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
