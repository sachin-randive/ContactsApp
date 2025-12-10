//
//  ProductViewModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import Foundation

@Observable
class ProductViewModel {
    var products = [Product]()
    
    private let service: ProductServiceProtocol
    
    init(service: ProductServiceProtocol = MocProductService()) {
        self.service = service
       // self.products = Product.mockProducts
       // Task { await fetchProducts()}
    }
    
    func fetchProducts() async {
        do {
            products = try await service.fetchProducts()
        } catch {
            // Handle error....
        }
    }
}
