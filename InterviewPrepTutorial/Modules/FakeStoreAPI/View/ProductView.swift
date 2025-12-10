//
//  ProductView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import SwiftUI

struct ProductView: View {
   // let products = Product.mockProducts
    @State private var viewModel = ProductViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
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
        .task { await viewModel.fetchProducts()}
    }
}

#Preview {
    ProductView()
}
