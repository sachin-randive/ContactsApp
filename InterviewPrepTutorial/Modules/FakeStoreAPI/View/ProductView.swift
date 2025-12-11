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
        Group {
            switch viewModel.loadingState {
            case .loading:
                ProgressView()
            case .empty:
                ContentUnavailableView("No Products Found", systemImage: "cart.fill")
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            case .completed(let products):
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
        .task { await viewModel.fetchProducts()}
    }
}

#Preview {
    ProductView()
}
