//
//  ProductViewModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import Foundation

@Observable
class ProductViewModel {
    //    var products = [Product]()
    
    var loadingState: ContentLoadingState<Product> = .loading
    
    private let service: ProductServiceProtocol
    
    init(service: ProductServiceProtocol = ProductService()) {
        self.service = service
        // self.products = Product.mockProducts
    }
    
    func fetchProducts() async {
        do {
            let products = try await service.fetchProducts()
            self.loadingState = products.isEmpty ? .empty : .completed(data: products)
        } catch {
            self.loadingState = .error(error: error)
        }
    }
}
