//
//  RemoteImage.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 27/12/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    func load(fromURLString urlString: String) {
        
        Networkmanager.shared.downloadImage(fromURLString: urlString) { uiImage in
            
            guard let uiImage else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(.foodPlaceholder).resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
