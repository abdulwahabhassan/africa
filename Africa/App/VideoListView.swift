//
//  VideoListView.swift
//  Africa
//
//  Created by Hassan Abdulwahab on 05/06/2022.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    //haptic impact generator
    let hapticImpactGenerator = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                } //: LOOP
            }//: LIST
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    videos.shuffle()
                    //haptic feedback
                    hapticImpactGenerator.impactOccurred()
                }) {
                    Image(systemName: "arrow.2.squarepath")
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
