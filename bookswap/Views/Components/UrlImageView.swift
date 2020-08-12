//
//  UrlImageView.swift
//  bookswap
//
//  Created by Tom Elvidge on 10/08/2020.
//  Copyright © 2020 Tom Elvidge. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
    
    @ObservedObject var urlImageModel: UrlImageModel
    
    static var defaultImage = UIImage(systemName: "questionmark")
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct UrlImageView_Preview: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
