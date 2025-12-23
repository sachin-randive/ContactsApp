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
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .empty:
                    ContentUnavailableView("No Products Found", systemImage: "cart.fill")
                case .error(let error):
                    Text("Error: \(error.localizedDescription)")
                case .completed:
                    List {
                        ForEach(filteredProducts) { product in
                            HStack {
                                AsyncImage(url: URL(string: product.image))
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .clipShape(.rect(cornerRadius: 10))
                                
                                LazyVStack(alignment: .leading) {
                                    Text(product.title)
                                    
                                    Text(product.description)
                                        .foregroundStyle(.gray)
                                        .lineLimit(4)
                                }
                                .font(.subheadline)
                                
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "search products...")
                }
            }
            .navigationTitle("Products")
            .refreshable { await viewModel.refreshProducts()}
            .task { await viewModel.fetchProducts()}
        }
    }
}
private extension ProductView {
    var filteredProducts: [Product] {
        guard !searchText.isEmpty else {
            return viewModel.products
        }
        return viewModel.products.filter {
            $0.title.lowercased().contains(searchText.lowercased()) ||
            $0.description.lowercased().contains(searchText.lowercased())
        }
    }
    
}

#Preview {
    ProductView()
}
