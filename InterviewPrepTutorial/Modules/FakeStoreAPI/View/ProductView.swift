//
//  ProductView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import SwiftUI

struct ProductView: View {
    let products = Product.mockProducts
    var body: some View {
        List {
            ForEach(products) { product in
                HStack {
                    AsyncImage(url: URL(string: product.image))
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(.rect(cornerRadius: 10))
                     
                    VStack(alignment: .leading) {
                        Text(product.title)
                        
                        Text(product.description)
                            .foregroundStyle(.gray)
                    }
                    .font(.subheadline)
                    
                }
            }
        }
    }
}

#Preview {
    ProductView()
}
